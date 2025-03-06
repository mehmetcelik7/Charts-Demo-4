//
//  LineChartHorizontalView.swift
//  Charts Demo 3
//
//  Created by mehmet Çelik on 5.03.2025.
//

import SwiftUI
import Charts
struct LineChartHorizontalView: View {
    let dailySales: [DailySalesType]
    var body: some View {
        Chart {
            ForEach(dailySales) { item in
                LineMark(x: .value("Sales", item.sales),
                       y:  .value("Day", item.day))
            }
        }
    }
}

#Preview {
    LineChartHorizontalView(dailySales: defaultDailySales)
}
