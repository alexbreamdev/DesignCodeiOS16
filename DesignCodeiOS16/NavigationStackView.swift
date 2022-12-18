//
//  NavigationStackView.swift
//  DesignCodeiOS16
//
//  Created by Oleksii Leshchenko on 17.12.2022.
//

import SwiftUI

struct NavigationStackView: View {
    var body: some View {
        NavigationStack {
            List(navigationItems) { item in
                NavigationLink(value: item) {
                    Label(item.title, systemImage: item.icon)
                        .foregroundColor(.primary)
                }
            }
            .navigationDestination(for: NavigationItem.self) { item in
                switch item.menu {
                    case .compass: ContentView()
                    case .card: ContentView()
                    case .radial: ContentView()
                    case .actionbutton: ContentView()
                    case .gooey: ContentView()
                    case .charts: ContentView()
                    case .halfsheet: ContentView()
                    
                }
            }
            .navigationTitle("SwiftUI Apps")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)
        }
    }
}

struct NavigationStackView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackView()
    }
}
