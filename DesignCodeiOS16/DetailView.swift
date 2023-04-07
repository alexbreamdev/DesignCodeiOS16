//
//  DetailView.swift
//  DesignCodeiOS16
//
//  Created by Oleksii Leshchenko on 10.02.2023.
//

import SwiftUI
// Rules for viewThatFits
// 1. Have as few fixed sizes as possible
// 2. VTF will try to fit first variant (1.) than second (2.)
// 3. Need to put VTF in scrollView or it won't work properly

struct DetailView: View {
    var body: some View {
        ScrollView {
            Text("12 Transactions".uppercased())
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .padding(.top, 20)
            
            Text("Entertainment")
                .font(.largeTitle.width(.expanded))
                .fontWeight(.bold)
            // MARK: - View that Fits
            // if frame >= 400 uses hstack (1.) else
            // uses vstack (2.)
            ViewThatFits {
                // 1. landscape varian
                HStack(alignment: .top, spacing: 20) {
                    VStack {
                        ChartView()
                        GridView()
                    }
                    VStack {
                        CardView()
                        GridView()
                    }
                    .frame(width: 400) // minimum size must be assigned
                }
                
                // 2. portrait variant
                VStack {
                    ChartView()
                    CardView()
                    GridView()
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailView()
            DetailView()
            // landscape orientation
                .previewInterfaceOrientation(.landscapeLeft)
               
        }
    }
}
