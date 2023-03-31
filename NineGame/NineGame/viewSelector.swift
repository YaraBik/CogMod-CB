import SwiftUI

struct viewSelector: View{
    @State private var showingGame: Int = 0
    @ObservedObject var model: NineViewModel
    
    var body: some View {
        if (showingGame == 0) {
            HomeView(model: model)
        }
        if (showingGame == 1) {
            MNSView(model: model)
        }
        if (showingGame == 2) {
            GameView(model: model)
        }
    }
}


