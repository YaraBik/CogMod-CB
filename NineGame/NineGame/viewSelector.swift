import SwiftUI

struct viewSelector: View{
    @State private var showingGame: Int = 0
    @ObservedObject var model: NineViewModel
    
    var body: some View {
        if (model.state == 0) {
            HomeView(model: model)
        }
        if (model.state == 1) {
            MNSView(model: model)
        }
        if (model.state == 2) {
            GameView(model: model)
        }
    }
}


