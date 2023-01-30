//
//  ChartView.swift
//  DesignCodeiOS16
//
//  Created by Oleksii Leshchenko on 30.01.2023.
//

import SwiftUI
import Charts

struct ChartView: View {
    var body: some View {
        Chart {
            ForEach(data) { value in
                LineMark(x: .value("Day", value.day), y: .value("Value", value.value), series: .value("Year", "2023"))
                    .cornerRadius(10)
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(by:.value("Year", "2023"))
                    .symbol(by: .value("Year", "2023"))
            }
            
            ForEach(data2) { value in
                LineMark(x: .value("Day", value.day), y: .value("Value", value.value), series: .value("Year", "2022"))
                    .cornerRadius(10)
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(by:.value("Year", "2022"))
                    .symbol(by: .value("Year", "2022"))
                
            }
     
        }
        .frame(height: 300)
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}


struct Value: Identifiable {
    var id = UUID()
    var day: String
    var value: Double
    
}

let data = [
    Value(day: "Jun 1", value: 200),
    Value(day: "Jun 2", value: 95),
    Value(day: "Jun 3", value: 312),
    Value(day: "Jun 4", value: 256),
    Value(day: "Jun 5", value: 505)
]

let data2 = [
    Value(day: "Jun 1", value: 234),
    Value(day: "Jun 2", value: 44),
    Value(day: "Jun 3", value: 450),
    Value(day: "Jun 4", value: 300),
    Value(day: "Jun 5", value: 405)
]
