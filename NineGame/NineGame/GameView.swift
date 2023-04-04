//
//  ContentView.swift
//  Negotiation
//
//  Created by J.N. Bikowski on 2/24/23.
//
//
import SwiftUI

struct GameView: View {
    @ObservedObject var model: NineViewModel
    @State private var GameViewSwitch: Int = 0
    @State var finalOffer: Bool = false
    var body: some View {
        if (GameViewSwitch == 1)
        {
            MNSView(model:model)
        }
        VStack {
            // Clock
            HStack {
                Text("⏱")
                Text("time") // TODO: start keeping track of game time here
            }
            // Info View
            HStack {
                ZStack {
                    Rectangle()
                        .fill()
                        .foregroundColor(.white)
                    Rectangle()
                        .stroke(lineWidth: 3)
                    VStack {
                        Text("🤖")
                            .font(.largeTitle)
                        Text("Model score: \(Int(model.model.modelScore))")
                        //Text("Player score: \(Int(model.model.playerScore))")// TODO: add score value here
                        Text("Model MNS: \(Int(model.suggestedModelMNS))")  // TODO: add model given MNS
                    }
                }
                ZStack {
                    Rectangle()
                        .fill()
                        .foregroundColor(.white)
                    Rectangle()
                        .stroke(lineWidth: 3)
                    Text(model.bidString) // TODO: add previous bids info
                }
            }
            .padding()
            
            // Submission field
            ZStack {
                Rectangle()
                    .fill()
                    .foregroundColor(.white)
                Rectangle()
                    .stroke(lineWidth: 3)
                VStack {
                    Text("I want:")
                    HStack {  // TODO: add selection actions
                        Button("1") { model.playerBid = 1 }
                            .frame(width: 20.0, height: 20.0)
                        Button("2") { model.playerBid = 2 }
                            .frame(width: 20.0, height: 20.0)
                        Button("3") { model.playerBid = 3 }
                            .frame(width: 20.0, height: 20.0)
                        Button("4") { model.playerBid = 4 }
                            .frame(width: 20.0, height: 20.0)
                        Button("5") { model.playerBid = 5 }
                            .frame(width: 20.0, height: 20.0)
                        Button("6") { model.playerBid = 6 }
                            .frame(width: 20.0, height: 20.0)
                        Button("7") { model.playerBid = 7 }
                            .frame(width: 20.0, height: 20.0)
                        Button("8") { model.playerBid = 8 }
                            .frame(width: 20.0, height: 20.0)
                        Button("9") { model.playerBid = 9 }
                            .frame(width: 20.0, height: 20.0)
                    }
                    // TODO: add toggle for final offer
                    let fo = Button(action: {
                        withAnimation {
                            self.finalOffer.toggle()
                        }
                    }) {
                        Text("This is my final offer")
                    }
                    if (finalOffer) {
                        fo.foregroundColor(.red)
                        
                    } else {
                        fo
                    }
                }
            }
            .padding()
            
            // Buttons
            VStack {  // TODO: add actions
                HStack {
                    Button("Submit Offer") {
                        if (model.model.modelFinal == false) {
                            if (model.playerBid != nil)
                            {
                                model.chooseBid(model.playerBid!, finalOffer)
                                if (model.flag == 1 || model.flag == 2){
                                    GameViewSwitch = 1
                                }
                            }
                            else{
                                print("Please pick a bid for this round!")
                            }
                        } else
                        {
                            print("you cannot counter bid on a final offer!")
                        }
                    }
                    .padding()
                    Button("Accept Offer") {
                        model.acceptOffer()
                        GameViewSwitch = 1
                    }
                    .padding()
                    Button("Decline Offer") {
                        model.declineOffer()
                        GameViewSwitch = 1
                    }
                    .padding()
                }
                .padding(.horizontal)
                
                Button("Quit Round") {
                    GameViewSwitch = 1
                    model.resetQuit()
                }
                .foregroundColor(.red)
                .padding()
            }

            // Scores
            HStack { // TODO: add in these values
                Text("MNS Value: " + String(model.playerMNS))
                    .padding([.bottom, .trailing], 30.0)
                Text("Score: " + String(model.model.playerScore))
                    .padding([.leading, .bottom], 30.0)
            }
            .padding()
        }
        .padding()
    }
}
