//
//  AreaChartHorizontalView.swift
//  Charts Demo 3
//
//  Created by mehmet Çelik on 5.03.2025.
//

import SwiftUI
import Charts
struct AreaChartHorizontalView: View {
    let dailySales: [DailySalesType]
    var body: some View {
        Chart {
            ForEach(dailySales) { item in
                AreaMark(x: .value("Sales", item.sales),
                       y:  .value("Day", item.day))
            }
        }
    }
}
#Preview {
    AreaChartHorizontalView(dailySales: defaultDailySales)
}
