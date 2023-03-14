////
////  ContentView.swift
////  Negotiation
////
////  Created by J.N. Bikowski on 2/24/23.
////
//
//import SwiftUI
//
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
////asd
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            ModelTextView()
//                .foregroundColor(.red)
//            GameView()
//            
//        }
//    }
//}
//
//struct ModelTextView: View {
//    var body: some View {
//        Text("🤖")
//        Text("Model")
//        TextField("Textfield :]", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct GameView: View {
//    var body: some View {
//        VStack {
//            HStack {
//                ScoreView()
//                PlayerActionView()
//            }
//            HStack {
//                OfferView()
//                RoundView()
//            }
//        }
//        .padding()
//    }
//}
//
//struct ScoreView: View {
//    @State var arrayToUpdate = [0,0,0]
//    var body: some View {
//        VStack {
//            Text("Your MNS value: " + String(arrayToUpdate[0]))
//            Text("Your score: " + String(arrayToUpdate[1]))
//            Text("Bids: " + String(arrayToUpdate[2]))
//        }
//    }
//}
//
//struct OfferView: View {
//    var body: some View {
//        HStack {
//            Button("Submit Offer") {
//                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//            }
//            Button("Accept Offer") {
//                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//            }
//        }
//    }
//}
//
//struct RoundView: View {
//    var body: some View {
//        HStack {
//            Button("Quit Round") {
//                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//            }
//            Button("Next Round") {
//                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//            }
//        }
//    }
//}
//
//struct PlayerActionView: View {
////    @State var finalOffer: Bool
//    var body: some View {
//        VStack {
//            Image(systemName: "smiley")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            HStack {
//                ButtonView(buttonNumber: 1)
//                ButtonView(buttonNumber: 2)
//                ButtonView(buttonNumber: 3)
//                ButtonView(buttonNumber: 4)
//                ButtonView(buttonNumber: 5)
//                ButtonView(buttonNumber: 6)
//                ButtonView(buttonNumber: 7)
//                ButtonView(buttonNumber: 8)
//                ButtonView(buttonNumber: 9)
//                //            Toggle("This is my final offer", isOn: $finalOffer)
//            }
//            Button("This is my final offer") {
//                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//            }.foregroundColor(.black)
//        }
//        .padding()
//    }
//}
//
//struct ButtonView: View {
//    var buttonNumber: Int
//    var body: some View {
//        // add some choice indicators later
//        Button(String(buttonNumber)) {
//            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//        }
//    }
//}
