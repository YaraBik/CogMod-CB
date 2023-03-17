//
//  ContentView.swift
//  Negotiation
//
//  Created by J.N. Bikowski on 2/24/23.
//
//
import SwiftUI


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView: View {
    @State var finalOffer: Bool = false
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
                        Text("Model score: 0") // TODO: add score value here
                        Text("Model MNS: ?")  // TODO: add model given MNS
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
                    HStack {  // TODO: add selection actions
                        Button("1") { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/ }
                            .frame(width: 20.0, height: 20.0)
                        Button("2") { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/ }
                            .frame(width: 20.0, height: 20.0)
                        Button("3") { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/ }
                            .frame(width: 20.0, height: 20.0)
                        Button("4") { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/ }
                            .frame(width: 20.0, height: 20.0)
                        Button("5") { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/ }
                            .frame(width: 20.0, height: 20.0)
                        Button("6") { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/ }
                            .frame(width: 20.0, height: 20.0)
                        Button("7") { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/ }
                            .frame(width: 20.0, height: 20.0)
                        Button("8") { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/ }
                            .frame(width: 20.0, height: 20.0)
                        Button("9") { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/ }
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
                Text("MNS Value: " + "x")
                    .padding([.bottom, .trailing], 30.0)
                Text("Score: " + "x")
                    .padding([.leading, .bottom], 30.0)
            }
            .padding()
        }
        .padding()
    }
}
