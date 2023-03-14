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
                TextField("History of bids", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
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
            }
            
            // Buttons
            HStack {
                Button("Submit MNS") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                Button("Quit Game") {
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
