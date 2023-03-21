//
//  StatisticsView.swift
//  Test
//
//  Created by J.N. Bikowski on 3/21/23.
//

import SwiftUI

struct StatisticsView: View {
    @State var gamesTotal: Int = 10
    @State var gamesWon: Int = 7
    @State var gamesQuit: Int = 1
//    @State var strategies: List = ["c", "a", "c", "a", "a", "c", "a", "a"]
    var body: some View {
        VStack {
            // Game info
            HStack {
                ZStack {
                    Rectangle()
                        .fill()
                        .foregroundColor(.white)
                    if (gamesWon < gamesTotal/2) {
                        Rectangle()
                            .stroke(lineWidth: 3)
                            .foregroundColor(.red)
                    } else {
                        Rectangle()
                            .stroke(lineWidth: 3)
                            .foregroundColor(.green)
                    }
                    Text("Games won: " + String(gamesWon)+"/"+String(gamesTotal))
                }
                Spacer()
                ZStack {
                    Rectangle()
                        .fill()
                        .foregroundColor(.white)
                    Rectangle()
                        .stroke(lineWidth: 3)
                        .foregroundColor(.red)
                    Text("Games quit: " + String(gamesQuit)+"/"+String(gamesTotal))
                }
            }
            .padding([.top, .leading, .trailing], 40)
            
            // Strategy graph
            Text("Strategy graph here... \n... \n... \n... \n... \n... \n... \n... \n...")
            
            // Reset statistics button
            ZStack {
                // TODO: make rectangles size of the button
                Rectangle()
                    .fill()
                    .foregroundColor(.white)
                Rectangle()
                    .stroke(lineWidth: 3)
                Button("Reset Statistics") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
            }
            .foregroundColor(.red)
            .padding(40)
        }
    }
}
