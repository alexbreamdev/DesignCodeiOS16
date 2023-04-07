//
//  ContentView.swift
//  DesignCodeiOS16
//
//  Created by Oleksii Leshchenko on 17.12.2022.
//

import SwiftUI
#warning("13 lesson completed")
struct ContentView: View {
    @State var showMenu = false
    @AppStorage("selectedMenu") var selectedMenu: Menu = .compass
    @GestureState var press = false
    
    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 1)
            .updating($press) { currentState, gestureState, transaction in
                gestureState = currentState
            }
            .onEnded { value in
                showMenu = true
            }
    }
    
    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()
            
            switch selectedMenu {
            case .compass:
                MessageView()
            case .card:
                Text("Card")
            case .charts:
                DetailView()
            case .radial:
                Text("Radial")
            case .halfsheet:
                Text("Halfsheet")
            case .gooey:
                Text("Gooey")
            case .actionbutton:
                Text("Action Button")
            }
           
        }
        // hack for scrolling bug of viewthatfits
        .onTapGesture {
        }
        .gesture(longPress)
        .sheet(isPresented: $showMenu) {
            MenuView()
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
