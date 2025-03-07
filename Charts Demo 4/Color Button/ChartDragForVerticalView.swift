//
//  ChartDragForVerticalView.swift
//  Charts Demo 4
//
//  Created by mehmet Çelik on 7.03.2025.
//

import SwiftUI
struct ChartDragForVerticalView: ViewModifier {
    @Binding var chartItem: ChartItem
    @Binding var isDragging: Bool
    
    var min: Double {
        chartItem.min
    }
    var max: Double {
        chartItem.max
    }
    
    func body(content: Content) -> some View {
        let innerProxyColor: Color = .clear
        
        content
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
                                        let (newDay,sales) = proxy.value(at: location, as: (String,Double).self) ?? ("Error",-1)
                                        
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
