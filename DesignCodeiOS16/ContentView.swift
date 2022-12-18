//
//  ContentView.swift
//  DesignCodeiOS16
//
//  Created by Oleksii Leshchenko on 17.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var showMenu = false
    @State var selectedMenu: Menu = .compass
    var body: some View {
        ZStack {
            switch selectedMenu {
            case .compass:
                MessageView()
            case .card:
                Text("Card")
            case .charts:
                Text("Charts")
            case .radial:
                Text("Radial")
            case .halfsheet:
                Text("Halfsheet")
            case .gooey:
                Text("Gooey")
            case .actionbutton:
                Text("Action Button")
            }
            Button("Show menu") {
                showMenu.toggle()
            }
            .sheet(isPresented: $showMenu) {
                MenuView(selectedMenu: $selectedMenu)
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
