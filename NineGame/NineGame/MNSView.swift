import SwiftUI

struct MNS_Previews: PreviewProvider {
    static var previews: some View {
        MNSView(model: NineViewModel())
    }
}

struct MNSView: View {
    @ObservedObject var model: NineViewModel
    @State private var GameViewSwitch: Int = 0
    
    var body: some View {
        if (GameViewSwitch == 1) {
            GameView(model: model)
        }
        VStack {
            // Clock
            HStack {
                Text("⏱")
                Text("time") // TODO: start keeping track of game time here
            }
            // Info View
            HStack {
                ZStack {
                    Rectangle()
                        .fill()
                        .foregroundColor(.white)
                    Rectangle()
                        .stroke(lineWidth: 3)
                    VStack {
                        Text("🤖")
                            .font(.largeTitle)
                        Text("Model score: \(model.model.modelScore)") // TODO: add score value here
                        Text("Model MNS: \(Int(model.suggestedModelMNS))")
                    }
                }
                ZStack {
                    Rectangle()
                        .fill()
                        .foregroundColor(.white)
                    Rectangle()
                        .stroke(lineWidth: 3)
                    Text("Exchange the MNS")
                }
            }
            .padding()
            
            // Submission field
            ZStack {
                Rectangle()
                    .fill()
                    .foregroundColor(.white)
                Rectangle()
                    .stroke(lineWidth: 3)
                VStack {
                    Text("My MNS is:")
                    HStack {  // TODO: add selection actions
                        Button("1") { model.highlightedMNS = 1
                            print("you highlighted MNS of 1")
                        }
                            .frame(width: 20.0, height: 20.0)
                        Button("2") { model.highlightedMNS = 2
                            print("you highlighted MNS of 2")
                        }
                            .frame(width: 20.0, height: 20.0)
                        Button("3") { model.highlightedMNS = 3
                            print("you highlighted MNS of 3")
                        }
                            .frame(width: 20.0, height: 20.0)
                        Button("4") { model.highlightedMNS = 4
                            print("you highlighted MNS of 4")
                        }
                            .frame(width: 20.0, height: 20.0)
                        Button("5") { model.highlightedMNS = 5
                            print("you highlighted MNS of 5")
                        }
                            .frame(width: 20.0, height: 20.0)
                        Button("6") { model.highlightedMNS = 6
                            print("you highlighted MNS of 6")
                        }
                            .frame(width: 20.0, height: 20.0)
                        Button("7") { model.highlightedMNS = 7
                            print("you highlighted MNS of 7")
                        }
                            .frame(width: 20.0, height: 20.0)
                        Button("8") { model.highlightedMNS = 8
                            print("you highlighted MNS of 8")
                        }
                            .frame(width: 20.0, height: 20.0)
                        Button("9") { model.highlightedMNS = 9
                            print("you highlighted MNS of 9")
                        }
                            .frame(width: 20.0, height: 20.0)
                    }
                }
            }
            .padding()
            
            // Buttons
            HStack {  // TODO: add actions
                Button("Submit MNS") {
                    if (model.highlightedMNS != nil) {
                        model.chooseMNS(model.highlightedMNS!)
                        model.highlightedMNS = nil
                        GameViewSwitch = 1
                    }
                    else {
                        print("Please make a bid first!")
                    }
                }
                .padding()
                Button("Quit Game") {
                    MainView(model: NineViewModel())
                }
                .foregroundColor(.red)
                .padding()
            }
            .padding(.horizontal)

            // Scores
            HStack { // TODO: add in these values
                Text("MNS Value: " + "\(model.model.playerMNS)")
                    .padding([.bottom, .trailing], 30.0)
                Text("Score: " + "\(model.model.playerScore)")
                    .padding([.leading, .bottom], 30.0)
            }
            .padding()
        }
        .padding()
    }
}
