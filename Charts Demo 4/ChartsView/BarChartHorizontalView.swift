//
//  BarChartHorizontalView.swift
//  Charts Demo 3
//
//  Created by mehmet Çelik on 5.03.2025.
//

import SwiftUI
import Charts
struct BarChartHorizontalView: View {
    let dailySales: [DailySalesType]
    let barColors: [Color]
    var body: some View {
        Chart {
            ForEach(dailySales) { item in
                BarMark(x: .value("Sales", item.sales),
                      y:  .value("Day", item.day))
                .foregroundStyle(by: .value("Day", item.day))
            }
        }
        .chartForegroundStyleScale(range: barColors)
    }
}

#Preview {
    BarChartHorizontalView(dailySales: defaultDailySales,barColors: defaultBarColors)
}
