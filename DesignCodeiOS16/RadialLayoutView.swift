//
//  RadialLayoutView.swift
//  DesignCodeiOS16
//
//  Created by Oleksii Leshchenko on 10.02.2023.
//

import SwiftUI
// 1. Customizes Layout of subviews (elements) in view
// 2. Layout protocol has 2 functions to implement
// 3. Replace container (vstack) with custom layout
// 4.
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
// MARK: - Custom Layout
struct CustomLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        // every element in the container is placed here
        for (index, subview) in subviews.enumerated() {
            // Point
            // first view appears in left corner
            var point = CGPoint(x: 24 * index, y: 24 * index)
                .applying(CGAffineTransform(rotationAngle: 2))
            
            // Center - first view shifts to the screan center
            point.x += bounds.midX
            point.y += bounds.midY
            // place each view in loop with coordinate
            subview.place(at: point, anchor: .center, proposal: .unspecified)
        }
    }
}
