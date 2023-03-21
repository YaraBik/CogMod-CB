//
//  MainView.swift
//  Test
//
//  Created by J.N. Bikowski on 3/17/23.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = "main"
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
             StatisticsView()
                .tabItem {
                    Label("Statistics", systemImage: "doc")
                }
        }
    }
}
