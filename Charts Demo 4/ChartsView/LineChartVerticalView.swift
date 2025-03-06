//
//  LineChartVerticalView.swift
//  Charts Demo 3
//
//  Created by mehmet Çelik on 5.03.2025.
//

import SwiftUI
import Charts
struct LineChartVerticalView: View {
    let dailySales: [DailySalesType]
    var body: some View {
        Chart {
            ForEach(dailySales) { item in
                LineMark(x: .value("Day", item.day),
                       y:  .value("Sales", item.sales))
            }
        }
    }
}

#Preview {
    LineChartVerticalView(dailySales: defaultDailySales)
}
