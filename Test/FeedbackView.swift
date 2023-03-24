//
//  FeedbackView.swift
//  Test
//
//  Created by J.N. Bikowski on 3/21/23.
//

import SwiftUI

struct FeedbackView: View {
    @State var trace: String = "Some trace,\nLoop through line-by-line\n..."
    @State var playerStrategy: String = "aggressive"
    @State var modelStrategy: String = "cooperative"
    
    @State var time: String = "3:14"
    @State var playerMNS: Int = 4
    @State var playerPoints: Int = 3
    @State var modelMNS: Int = 2
    @State var modelPoints: Int = 0
    
    var body: some View {
        // TODO: get these from the model based on game that was just played
//        Rectangle()
//            .fill()
//            .foregroundColor(.black)
        VStack {
            Text("The round took " + String(time) + " minutes")
                .padding()
                .font(.footnote)
            let playerInfo: String = "Your MNS was " + String(playerMNS) + " and you gained " + String(playerPoints) + " points."
            let modelInfo: String = "The model's MNS was " + String(modelMNS) + " and it gained " + String(modelPoints) + " points."
            VStack {
                Text(playerInfo)
                Text(modelInfo)
            }
            .font(/*@START_MENU_TOKEN@*/.body/*@END_MENU_TOKEN@*/)

            ZStack {
                Rectangle()
                    .fill()
                    .foregroundColor(.white)
                Rectangle()
                    .stroke(lineWidth: 3)
                VStack {
                    Text("Trace of bids in the round:")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                    ScrollView {
                        VStack(alignment: .leading) {
                            ForEach(0..<50) { // TODO: loop through trace/history (based on length?)
                                Text("\($0): " + trace)
                                    .font(/*@START_MENU_TOKEN@*/.body/*@END_MENU_TOKEN@*/)
                                    .multilineTextAlignment(.leading)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 10.0)
            .padding(.vertical)

            VStack {
//                let range = (modelStrategy as NSString).range(of: modelStrategy)
//                let attrModelStrat = NSMutableAttributedString.init(string: modelStrategy)
//                attrModelStrat.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: range)
                var attributedString = AttributedString(modelStrategy).foregroundColor(.red)
//                modelStrategy.foregroundColor(.red)
                Text("The model used the " + attributedString + " strategy.")
//                    .foregroundColor(.red)
                Text("It thinks you used the " + playerStrategy + " strategy.")
            }
            .font(/*@START_MENU_TOKEN@*/.footnote/*@END_MENU_TOKEN@*/)

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
