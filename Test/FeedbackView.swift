//
//  FeedbackView.swift
//  Test
//
//  Created by J.N. Bikowski on 3/21/23.
//

import SwiftUI

struct FeedbackView: View {
    @State var trace: String = "Some trace,\n But don't know the format\n...\n..."
    @State var playerStrategy: String = "aggressive"
    @State var modelStrategy: String = "cooperative"
    
    var body: some View {
        // TODO: get these from the model based on game that was just played
        Rectangle()
            .fill()
            .foregroundColor(.black)
        VStack {
            RoundInfoView()

            ZStack {
                Rectangle()
                    .fill()
                    .foregroundColor(.white)
                Rectangle()
                    .stroke(lineWidth: 3)
                VStack {
                    Text("Trace of bids in the round")
                    Text(String(trace))  // TODO: add scrollbar to trace
                }
            }

            VStack {
                Text("The model used the " + String(modelStrategy) + " strategy")
                Text("The modelthinks you used the " + String(playerStrategy) + " strategy")
            }

            // buttons
            HStack {
                Button("Next Round") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .padding()
                Button("Quit Game") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .padding()
            }
            .padding()
        }
    }
}

struct RoundInfoView: View {
    @State var time: String = "3:14"
    @State var playerMNS: Int = 4
    @State var playerPoints: Int = 3
    @State var modelMNS: Int = 2
    @State var modelPoints: Int = 0
    var body: some View {
        Text("The round took " + String(time) + " minutes")
            .padding()

        VStack {
            Text("Your MNS was " + String(playerMNS) + " and you gained " + String(playerPoints) + " points")
            Text("The model's MNS was " + String(modelMNS) + " and it gained " + String(modelPoints) + " points")
        }
    }
}
