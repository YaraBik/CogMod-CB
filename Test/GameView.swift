//
//  ContentView.swift
//  Negotiation
//
//  Created by J.N. Bikowski on 2/24/23.
//
//
import SwiftUI


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

struct GameView: View {
    // TODO: get these variables
    @State var finalOffer: Bool = false
    @State var playerAction: Int = 0
    @State var playerMNS: Int = 4
    @State var modelMNS: Int = 1
    @State var playerScore: Int = 0
    @State var modelScore: Int = 0
    var body: some View {
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
                        Text("Model score: " + String(modelScore))
                        Text("Model MNS: " + String(modelMNS))
                    }
                }
                ZStack {
                    Rectangle()
                        .fill()
                        .foregroundColor(.white)
                    Rectangle()
                        .stroke(lineWidth: 3)
                    Text("Bid history") // TODO: add previous bids info
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
                    HStack {  // TODO: value of var "playerAction" knows which value pressed button is
                        GameButtonView(playerMNS: $playerMNS, buttonNr: 1, playerAction: $playerAction)
                        GameButtonView(playerMNS: $playerMNS, buttonNr: 2, playerAction: $playerAction)
                        GameButtonView(playerMNS: $playerMNS, buttonNr: 3, playerAction: $playerAction)
                        GameButtonView(playerMNS: $playerMNS, buttonNr: 4, playerAction: $playerAction)
                        GameButtonView(playerMNS: $playerMNS, buttonNr: 5, playerAction: $playerAction)
                        GameButtonView(playerMNS: $playerMNS, buttonNr: 6, playerAction: $playerAction)
                        GameButtonView(playerMNS: $playerMNS, buttonNr: 7, playerAction: $playerAction)
                        GameButtonView(playerMNS: $playerMNS, buttonNr: 8, playerAction: $playerAction)
                        GameButtonView(playerMNS: $playerMNS, buttonNr: 9, playerAction: $playerAction)
                    }
                    FinalOfferToggle(finalOffer: $finalOffer)
                }
            }
            .padding()
            
            // Buttons
            VStack {  // TODO: add actions
                HStack {
                    Button("Submit Offer") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .padding()
                    Button("Accept Offer") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .padding()
                }
                .padding(.horizontal)
                
                Button("Quit Round") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .foregroundColor(.red)
                .padding()
            }

            // Scores
            HStack { // TODO: add in these values
                Text("MNS Value: " + String(playerMNS))
                    .padding([.bottom, .trailing], 30.0)
                Text("Score: " + String(playerScore))
                    .padding([.leading, .bottom], 30.0)
            }
            .padding()
        }
        .padding()
    }
}

struct FinalOfferToggle: View {
    @Binding var finalOffer: Bool
    // TODO: make sure that can click square as well as text
    var body: some View {
        if (finalOffer) {
            HStack {
                Rectangle()
                    .foregroundColor(.black)
                    .frame(width: 10.0, height: 10.0)
                
                Button(action: { withAnimation {
                        self.finalOffer.toggle()
                } }) {
                    Text("This is my final offer")
                }
            }
        } else {
            HStack {
                Rectangle()
                    .stroke()
                    .frame(width: 10.0, height: 10.0)
                Button(action: { withAnimation {
                        self.finalOffer.toggle()
                } }) {
                    Text("This is my final offer")
                }
            }
        }
    }
}

struct GameButtonView: View {
    @Binding var playerMNS: Int
    @State var buttonNr: Int
    @Binding var playerAction: Int
    var body: some View {
//        let _ = print(playerAction, buttonNr)
        if (buttonNr < playerMNS) {
            ZStack {
                if (playerAction == buttonNr) {
                    Circle()
                        .strokeBorder(.pink, lineWidth: 2)
                        .background(Circle().foregroundColor(Color(red:1.0, green:0.84, blue:0.46)))
                        .frame(width: 25.0, height: 25.0)
                } else {
                    Circle()
                        .strokeBorder(.pink, lineWidth: 2)
                        .background(Circle().foregroundColor(.white))
                        .frame(width: 25.0, height: 25.0)
                }
                Button(String(buttonNr)) { playerAction = buttonNr }
                    .frame(width: 20.0, height: 20.0)
                    .foregroundColor(.pink)
            }
        } else {
            ZStack {
                if (playerAction == buttonNr) {
                    Circle()
                        .strokeBorder(.black, lineWidth: 2)
                        .background(Circle().foregroundColor(Color(red:0.4627, green:0.8392, blue:1.0)))
                        .frame(width: 25.0, height: 25.0)
                } else {
                    Circle()
                        .strokeBorder(.black, lineWidth: 2)
                        .background(Circle().foregroundColor(.white))
                        .frame(width: 25.0, height: 25.0)
                }
                Button(String(buttonNr)) { playerAction = buttonNr }
                    .frame(width: 20.0, height: 20.0)
            }
        }
    }
}
