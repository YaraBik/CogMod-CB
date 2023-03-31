import SwiftUI


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(model: NineViewModel())
    }
}

struct HomeView: View {
    @ObservedObject var model: NineViewModel
    @State var reqView: Int = 0
    var body: some View {
        if (reqView == 1) {
            MNSView(model: model) // TODO: remove original view
            // TODO: Check to make sure this doesn't introduce too much lag
        }
        VStack {
            Text("The Game of Nine")
            // How to play game stuff?
//            Button("?") {
//                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//            }
            //Picture
            Button("Play a Game") {
                reqView = 1
            }
            
            Button("Reset Model") {
                model.reset()
            }
            .foregroundColor(.red)
            
            Button("Statistics") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
        }
    }
}
