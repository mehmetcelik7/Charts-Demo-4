//
//  LineChartVerticalView.swift
//  Charts Demo 3
//
//  Created by mehmet Çelik on 5.03.2025.
//

import SwiftUI
import Charts
struct LineAreaChartVerticalView: View {
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
                AreaMark(x: .value("Day", item.day),
                       y:  .value("Sales", item.sales))
                .foregroundStyle(chartItem.lineAreaColor
                    .opacity(0.3))
            }
           
                
                
                LineMark(x: .value("Day", item.day),
                       y:  .value("Sales", item.sales))
                .foregroundStyle(chartItem.lineAreaColor)
                .symbol(){
                    Annotate_Line_Area_Graph(charItem: chartItem)
                }
            }
            if isDragging {
                RuleMarkForVerticalView(chartItem: chartItem, salesOnSelectedDay: salesOnSelectedDay)
            }

        }
        chartYScale(domain: min...max)
            .modifier(ChartDragForVerticalView(chartItem: $chartItem, isDragging: $isDragging))
    }
}

#Preview {
    LineAreaChartVerticalView(chartItem: .constant(.defaultChartItem))
}
