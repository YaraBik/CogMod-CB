//
//  HomeView.swift
//  Test
//
//  Created by J.N. Bikowski on 14/03/2023.
//

import SwiftUI


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct HomeView: View {
    @State var toMNSView: Bool = false
    var body: some View {
        if (toMNSView) {
            MNSView() // TODO: remove original view
            // TODO: Check to make sure this doesn't introduce too much lag?
        } else {
            VStack {
                Text("The Game of Nine")
                // How to play game stuff?
                //            Button("?") {
                //                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                //            }
                //Picture
                Button("Play a Game") {
                    toMNSView.toggle()
                }
                
                Button("Reset Model") { // TODO: ask confirmation
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .foregroundColor(.red)
                //            .confirmationDialog(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=titleKey: LocalizedStringKey@*/LocalizedStringKey/*@END_MENU_TOKEN@*/, isPresented: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Binding<Bool>@*/Binding<Bool>/*@END_MENU_TOKEN@*/) {
                //                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/
                //            }
            }
        }
    }
}
