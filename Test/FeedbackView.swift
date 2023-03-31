//
//  FeedbackView.swift
//  Test
//
//  Created by J.N. Bikowski on 3/21/23.
//

import SwiftUI

struct FeedbackView: View {
    // TODO: get these from the model based on game that was just played
    @State var trace: String = "Some trace,\nLoop through line-by-line\n..."
    @State var playerStrategy: String = "aggressive"
    @State var modelStrategy: String = "cooperative"
    
    @State var time: String = "3:14"
    @State var playerMNS: Int = 4
    @State var playerPoints: Int = 3
    @State var modelMNS: Int = 2
    @State var modelPoints: Int = 0
    
    var body: some View {
        VStack {
            Text("The round took " + String(time) + " minutes")
                .padding()
                .font(.footnote)
            
            let playerInfo: String = "Your MNS was " + String(playerMNS) + " and you gained "
            let modelInfo: String = "The model's MNS was " + String(modelMNS) + " and it gained "
            VStack {
                if (playerPoints > 0) {
                    Text(playerInfo)
                    + Text(String(playerPoints)).foregroundColor(.green).bold().font(.body)
                    + Text(" points.")
                } else if (playerPoints < 0) {
                    Text(playerInfo)
                    + Text(String(playerPoints)).foregroundColor(.red).bold().font(.body)
                    + Text(" points.")
                } else {
                    Text(playerInfo)
                    + Text(String(playerPoints)).font(.body)
                    + Text(" points")
                }
                
                if (modelPoints > 0) {
                    Text(modelInfo)
                    + Text(String(modelPoints)).foregroundColor(.green).bold().font(.body)
                    + Text(" points.")
                } else if (modelPoints < 0) {
                    Text(modelInfo)
                    + Text(String(modelPoints)).foregroundColor(.red).bold().font(.body)
                    + Text(" points.")
                } else {
                    Text(modelInfo)
                    + Text(String(modelPoints)).font(.body)
                    + Text(" points")
                }
            }
            .font(.footnote)

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
//                var attributedString = AttributedString(modelStrategy)//.foregroundColor(.red)
//                modelStrategy.foregroundColor(.red)
                if (modelStrategy == "aggressive") {
                    Text("The model used the ")
                    + Text(modelStrategy + " strategy").foregroundColor(.orange).font(.body)
                } else if (modelStrategy == "cooperative") {
                    Text("The model used the ")
                    + Text(modelStrategy + " strategy").foregroundColor(.cyan).font(.body)
                } else {
                    Text("The model used the " + modelStrategy + " strategy")
                }
                
                if (playerStrategy == "aggressive") {
                    Text("It thinks you used the ")
                    + Text(playerStrategy + " strategy").foregroundColor(.orange).font(.body)
                } else if (modelStrategy == "cooperative") {
                    Text("It thinks you used the ")
                    + Text(playerStrategy + " strategy").foregroundColor(.cyan).font(.body)
                } else {
                    Text("It thinks you used the " + playerStrategy + " strategy")
                }
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
                }.foregroundColor(.pink)
                .padding()
            }
            .padding()
        }
    }
}
