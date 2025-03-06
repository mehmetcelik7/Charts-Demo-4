//
//  BarChartHorizontalView.swift
//  Charts Demo 3
//
//  Created by mehmet Çelik on 5.03.2025.
//

import SwiftUI
import Charts
struct BarChartHorizontalView: View {
    @Binding var chartItem: ChartItem
    var min: Double {
        chartItem.min
    }
    var max: Double {
        chartItem.max
    }
    let innerProxyColor: Color = .black.opacity(0.2)
    @State var isDragging: Bool = false

    var salesOnSelectedDay: Double {
        getSalesOfSelectedDay(
            dailySales: chartItem.dailySales,
            selectedDay: chartItem.selectedDay
        )
    }
    var body: some View {
        Chart {
            if isDragging {
                RuleMarkForHorizontalView(chartItem: chartItem, salesOnSelectedDay: salesOnSelectedDay)
            }
            ForEach(chartItem.dailySales) { item in
                BarMark(x: .value("Sales", item.sales),
                      y:  .value("Day", item.day))
                .foregroundStyle(by: .value("Day", item.day))
            }
        }
        .chartForegroundStyleScale(range: chartItem.barColors)
        chartXScale(domain: min...max)
            .chartOverlay {
                proxy in
                GeometryReader {
                    innerProxy in
                    Rectangle()
                        .fill(innerProxyColor)
                        .contentShape(Rectangle())
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    if chartItem.editMode {
                                        isDragging = true
                                        
                                        let location = value.location
                                        let (sales,newDay) = proxy.value(at: location, as: (Double,String).self) ?? (-1,"error")
                                        
                                        chartItem.selectedDay = newDay
                                        print(newDay)
                                        print(sales)
                                        
                                        setSalesOfSelectedDay(
                                            dailySales: &chartItem.dailySales,
                                            selectedDay: chartItem.selectedDay,
                                            sales: sales,
                                            min: min,
                                            max: max
                                        )
                                        
                                    }
                                }
                                .onEnded({ value in
                                 
                                    isDragging = false
                                    
                                })
                        )
                }
            }

    }
}

#Preview {
    BarChartHorizontalView(chartItem: .constant(.defaultChartItem))
}
