### Custom Layout
You traditionally arrange views in your app’s user interface using built-in layout containers like HStack and Grid. If you need more complex layout behavior, you can define a custom layout container by creating a type that conforms to the Layout protocol and implementing its required methods:

sizeThatFits(proposal:subviews:cache:) reports the size of the composite layout view.

placeSubviews(in:proposal:subviews:cache:) assigns positions to the container’s subviews.

You can define a basic layout type with only these two methods:
```
struct BasicVStack: Layout {
    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGSize {
        // Calculate and return the size of the layout container.
    }

    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) {
        // Tell each subview where to appear.
    }
}
```
Use your layout the same way you use a built-in layout container, by providing a ViewBuilder with the list of subviews to arrange:
```
BasicVStack {
    Text("A Subview")
    Text("Another Subview")
}
```
[Apple Documentation](https://developer.apple.com/documentation/swiftui/layout)

[Implementation](https://github.com/alexbreamdev/DesignCodeiOS16/blob/main/DesignCodeiOS16/RadialLayoutView.swift)
