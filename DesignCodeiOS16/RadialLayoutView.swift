//
//  RadialLayoutView.swift
//  DesignCodeiOS16
//
//  Created by Oleksii Leshchenko on 10.02.2023.
//

import SwiftUI

struct RadialLayoutView: View {
    var icons = ["calendar", "message", "figure.walk", "music.note"]
    
    var body: some View {
        CustomLayout {
            ForEach(icons, id: \.self) { icon in
                Circle()
                    .frame(width: 44)
                    .foregroundColor(.black)
                    .overlay {
                        Image(systemName: icon)
                            .foregroundColor(.white)
                }
            }
        }
    }
}

struct RadialLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        RadialLayoutView()
    }
}

struct CustomLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        for (index, subview) in subviews.enumerated() {
            // Point
            var point = CGPoint(x: 50 * index, y: 50 * index)
                .applying(CGAffineTransform(rotationAngle: 5))
            
            // Center
            point.x += bounds.midX
            point.y += bounds.midY
            subview.place(at: point, anchor: .center, proposal: .unspecified)
        }
    }
    
    
    
}
