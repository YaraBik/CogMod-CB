//
//  GameView.swift
//  Test
//
//  Created by J.N. Bikowski on 14/03/2023.
//

import SwiftUI


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

struct GameView: View {
    var body: some View {
        VStack {
            // clock
            HStack {
                Text("⏱")
                Text("time")
            }
            // info view
            HStack {
                // model view
                ZStack {
                    Rectangle()
                        .fill()
                        .foregroundColor(.white)
                    Rectangle()
                    VStack {
                        Text("🤖")
                        Text("Model")
                    }
                }
                .padding(10)

                // text field
                TextField("Exchange MNS", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            }
            
            // Choose MNS view
            HStack {
                Button("1") { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/ }
                Button("2") { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/ }
                Button("3") { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/ }
                Button("4") { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/ }
                Button("5") { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/ }
                Button("6") { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/ }
                Button("7") { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/ }
                Button("8") { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/ }
                Button("9") { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/ }
                //            Toggle("This is my final offer", isOn: $finalOffer)
                Button("This is my final offer") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }.foregroundColor(.black)
            }
            
            // Buttons
            HStack {
                Button("Submit Offer") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                Button("Accept Offer") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                Button("Quit Round") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .foregroundColor(.red)
            }
            
            // Scores
            HStack {
                Text("MNS Value: " + "x")
                Text("Score: " + "x")
            }
        }
    }
}
