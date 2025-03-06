//
//  BarChartVerticalView.swift
//  Charts Demo 3
//
//  Created by mehmet Çelik on 5.03.2025.
//

import SwiftUI
import Charts





struct BarChartVerticalView: View {
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
                RuleMarkView(selectedDay: chartItem.selectedDay, salesOnSelectedDay: salesOnSelectedDay, intMode: true)
            }
            ForEach(chartItem.dailySales) { item in
                BarMark(x: .value("Day", item.day),
                      y:  .value("Sales", item.sales))
                .foregroundStyle(by: .value("Day", item.day))
                .annotation(position: .top) {
                    Image(systemName: "circle")
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .opacity(chartItem.editMode ? 0.8 : 0)
                }
            }
            
            
            
            
            
            
        }
        
        .chartForegroundStyleScale(range: chartItem.barColors)
        .chartYScale(domain: min...max)
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
                                    let (newDay, sales) = proxy.value(at: location, as: (String,Double).self) ?? ("error",-1)
                                    
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
    BarChartVerticalView(chartItem: .constant(ChartItem.defaultChartItem))
}
