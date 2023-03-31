//
//  GameView.swift
//  Test
//
//  Created by J.N. Bikowski on 14/03/2023.
//

import SwiftUI


struct MNS_Previews: PreviewProvider {
    static var previews: some View {
        MNSView()
    }
}

struct MNSView: View {
    // TODO: get these variables
    @State var playerMNS: Int = 4
    @State var playerScore: Int = 0
    @State var modelScore: Int = 0
    @State var playerAction: Int = 0
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
                        Text("Model score: " + String(modelScore)) // TODO: add score value here
                        Text("Model MNS: ?")
                    }
                }
                ZStack {
                    Rectangle()
                        .fill()
                        .foregroundColor(.white)
                    Rectangle()
                        .stroke(lineWidth: 3)
                    Text("Exchange the MNS")
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
                    Text("My MNS is:")
                    HStack {  // TODO: get clicked MNS value from variable "playerAction"
                        MNSButtonView(playerMNS: $playerMNS, buttonNr: 1, playerAction: $playerAction)
                        MNSButtonView(playerMNS: $playerMNS, buttonNr: 2, playerAction: $playerAction)
                        MNSButtonView(playerMNS: $playerMNS, buttonNr: 3, playerAction: $playerAction)
                        MNSButtonView(playerMNS: $playerMNS, buttonNr: 4, playerAction: $playerAction)
                        MNSButtonView(playerMNS: $playerMNS, buttonNr: 5, playerAction: $playerAction)
                        MNSButtonView(playerMNS: $playerMNS, buttonNr: 6, playerAction: $playerAction)
                        MNSButtonView(playerMNS: $playerMNS, buttonNr: 7, playerAction: $playerAction)
                        MNSButtonView(playerMNS: $playerMNS, buttonNr: 8, playerAction: $playerAction)
                        MNSButtonView(playerMNS: $playerMNS, buttonNr: 9, playerAction: $playerAction)
                    }
                }
            }
            .padding(.vertical)
            
            // Buttons
            HStack {  // TODO: add actions
                Button("Submit MNS") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .padding()
                // TODO: maybe make smaller, so harder to accidentally touch?
                Button("Quit Game") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .foregroundColor(.red)
                .padding()
            }
            .padding(.horizontal)

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


struct MNSButtonView: View {
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
                        .frame(width: 27.0, height: 27.0)
                } else {
                    Circle()
                        .strokeBorder(.pink, lineWidth: 2)
                        .background(Circle().foregroundColor(.white))
                        .frame(width: 27.0, height: 27.0)
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
                        .frame(width: 27.0, height: 27.0)
                } else {
                    Circle()
                        .strokeBorder(.black, lineWidth: 2)
                        .background(Circle().foregroundColor(.white))
                        .frame(width: 27.0, height: 27.0)
                }
                Button(String(buttonNr)) { playerAction = buttonNr }
                    .frame(width: 20.0, height: 20.0)
            }
        }
    }
}
