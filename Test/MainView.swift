//
//  MainView.swift
//  Test
//
//  Created by J.N. Bikowski on 3/17/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            MNSView()
                .tabItem {
                    Label("Game", systemImage: "doc")
                }
        }
    }
}
