//
//  ContentView.swift
//  Charts Demo 3
//
//  Created by mehmet Çelik on 5.03.2025.
//

import SwiftUI
import Charts

enum ChartType {
    case bar, line, area
}



struct ContentView: View {
    
    @Binding var chartItem: ChartItem
    
    let xAxisMarkPosition: AxisMarkPosition = .bottom
    let yAxisMarkPosition: AxisMarkPosition = .leading

    var body: some View {
        VStack{
            
            
            if chartItem.isVerticalChart {
                
                switch(chartItem.chartType) {
                case .bar:
                    BarChartVerticalView(chartItem: $chartItem)
                case .line, .area:
                    LineAreaChartVerticalView(chartItem: $chartItem)
                }
                
            }else{
                switch(chartItem.chartType) {
                case .bar:
                    BarChartHorizontalView(chartItem: $chartItem)
                    
                case .line, .area:
                    LineAreaChartHorizontalView(chartItem: $chartItem)
                    
                }
            }
        }
    }
}

#Preview {
    ContentView(chartItem: .constant(.defaultChartItem))
}
