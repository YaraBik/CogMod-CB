import SwiftUI

struct MainView: View {
    @ObservedObject var model: NineViewModel
    var body: some View {
        HomeView(model: model)
        //TabView {
        //    HomeView(model: model)
        //        .tabItem {
        //            Label("Home", systemImage: "house")
        //        }
        //    MNSView(model: model)
        //        .tabItem {
        //            Label("Game", systemImage: "doc")
        //        }
        //}
    }
}

