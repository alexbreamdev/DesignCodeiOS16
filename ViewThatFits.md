### ViewThatFits

>  Rules for viewThatFits
> 1. Have as few fixed sizes as possible
> 2. VTF will try to fit first variant (1.) than second (2.)
> 3. Need to put VTF in scrollView or it won't work properly

[Look here code](https://github.com/alexbreamdev/DesignCodeiOS16/blob/main/DesignCodeiOS16/DetailView.swift)

```swift
///if frame >= 400 uses hstack (1.) else
///uses vstack (2.)
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
```
