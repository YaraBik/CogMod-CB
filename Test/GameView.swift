//
//  GameView.swift
//  Test
//
//  Created by J.N. Bikowski on 14/03/2023.
//

import SwiftUI


struct GameView_Previews: PreviewProvider {
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
                TextField("Exchange MNS", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            }
            
            // Choose MNS view
            HStack {
                ButtonView(buttonNumber: 1)
                ButtonView(buttonNumber: 2)
                ButtonView(buttonNumber: 3)
                ButtonView(buttonNumber: 4)
                ButtonView(buttonNumber: 5)
                ButtonView(buttonNumber: 6)
                ButtonView(buttonNumber: 7)
                ButtonView(buttonNumber: 8)
                ButtonView(buttonNumber: 9)
                //            Toggle("This is my final offer", isOn: $finalOffer)
                Button("This is my final offer") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }.foregroundColor(.black)
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

//struct ButtonView: View {
//    var buttonNumber: Int
//    var body: some View {
//        // add some choice indicators later
//        Button(String(buttonNumber)) {
//            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//        }
//    }
//}

//struct GameView: View {
//    var body: some View {
//        VStack {
//            Text("The Game of Nine")
//            Button("?") {
//                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//            }
//            //Picture
//            Button("Play a Game") {
//                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//            }
//
//            Button("Reset Model") {
//                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//            }
//            .foregroundColor(.red)
//
//            Button("Statistics") {
//                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//            }
//        }
//    }
//}
