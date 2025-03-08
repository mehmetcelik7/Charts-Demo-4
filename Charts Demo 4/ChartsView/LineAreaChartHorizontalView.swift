//
//  LineChartHorizontalView.swift
//  Charts Demo 3
//
//  Created by mehmet Çelik on 5.03.2025.
//

import SwiftUI
import Charts
struct LineAreaChartHorizontalView: View {
    @Binding var chartItem: ChartItem
    var min: Double {
        chartItem.min
    }
    var max: Double {
        chartItem.max
    }
    
    @State var isDragging: Bool = false
    var salesOnSelectedDay: Double {
        getSalesOfSelectedDay(
            dailySales: chartItem.dailySales,
            selectedDay: chartItem.selectedDay
        )
    }
    
    var body: some View {
        Chart {
            ForEach(chartItem.dailySales) { item in
                
                
                if chartItem.chartType == .area {
                    AreaMark(x: .value("Sales", item.sales),
                           y: .value("Day", item.day) )
                    .foregroundStyle(chartItem.lineAreaColor
                        .opacity(0.3))
                }
                
                
                LineMark(x: .value("Sales", item.sales),
                       y:  .value("Day", item.day))
                .foregroundStyle(chartItem.lineAreaColor)
                .symbol(){
                    Annotate_Line_Area_Graph(charItem: chartItem)
                }
            }
            if isDragging {
                RuleMarkForHorizontalView(chartItem: chartItem, salesOnSelectedDay: salesOnSelectedDay)
            }
        }
        .chartXScale(domain: min...max)
            .modifier(ChartDragForHorizontalView(chartItem: $chartItem, isDragging: $isDragging))
    }
}

#Preview {
    LineAreaChartHorizontalView(chartItem: .constant(.defaultChartItem))
}
