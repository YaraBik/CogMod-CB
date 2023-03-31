//
//  StatisticsView.swift
//  Test
//
//  Created by J.N. Bikowski on 3/21/23.
//

import SwiftUI
import Charts

struct StatisticsView: View {
    @State var gamesTotal: Int = 10
    @State var gamesWon: Int = 7
    @State var gamesQuit: Int = 1
    @State var strategies: [String] = ["c", "a", "c", "a", "a", "c", "a", "a", "a", "a", "a", "a", "a"]
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
                        .padding()
                }.fixedSize()
                Spacer()
                ZStack {
                    Rectangle()
                        .fill()
                        .foregroundColor(.white)
                    Rectangle()
                        .stroke(lineWidth: 3)
                        .foregroundColor(.red)
                    Text("Games quit: " + String(gamesQuit)+"/"+String(gamesTotal))
                        .padding()
                }.fixedSize()
            }
            .padding(.all, 40)
            
            // Strategy graph
            Text("Expected strategy over time").font(.title)
            Text("According to last 10 games.").font(.footnote)
            StrategyChart(measurements: $strategies)
                .padding(.horizontal)
            
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
                .padding()
            }.fixedSize()
            .foregroundColor(.red)
            .padding(40)
        }
    }
}


struct StrategyChart: View {
    @Binding var measurements: [String]
    var body: some View {
        var data: [StratPerc] = stratPercByGame(measurements)
        Chart(data) {
            LineMark(
                x: .value("Game", $0.game),
                y: .value("Percentage", $0.perc)
            )
            .foregroundStyle(by: .value("Strategy", $0.strat))
        }
        .chartForegroundStyleScale(["Cooperative": .cyan, "Aggressive": .orange])
        .chartLegend()
        .chartYAxis(.hidden)
    }
}

struct StratPerc: Identifiable {
    var game: String
    var strat: String
    var perc: Double
    var id = UUID()
}

func stratPercByGame(_ measurement: [String]) -> [StratPerc] {
    var games: Int = 0
    var coop: Double = 0.0
    var aggr: Double = 0.0
    var perc: [StratPerc] = []
    var min_i: Int = 0
    
    for i in (0..<measurement.count) {
        coop = 0
        aggr = 0
        games += 1
        if (games > 10) {
            // Only look at last 10 games
            min_i = games-10
        }
        
        for m in measurement[min_i...i] {
            if (m == "c") {
                coop += 1.0
            }
            if (m == "a") {
                aggr += 1.0
            }
        }
        
        perc.append(StratPerc(game: String(games),
                              strat: "Cooperative",
                              perc: coop/Double(games)*100.0 ) )
        perc.append(StratPerc(game: String(games),
                              strat: "Aggressive",
                              perc: aggr/Double(games)*100.0 ) )
    }
    return perc
}
