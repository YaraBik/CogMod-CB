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
                }
            }
            .padding()
            
            // Buttons
            HStack {  // TODO: add actions
                Button("Submit MNS") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .padding()
                Button("Quit Game") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .foregroundColor(.red)
                .padding()
            }
            .padding(.horizontal)

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
