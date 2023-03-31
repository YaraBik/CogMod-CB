import SwiftUI

@main
struct TestApp: App {
    var modelView = NineViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView(model : modelView)
            //ContentView(model: modelView)
        }
    }
}
