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
    
    let dailySales: [DailySalesType]
    let min: Double
    let max: Double
    @State var barColors: [Color] = defaultBarColors

    let xAxisMarkPosition: AxisMarkPosition = .bottom
    let yAxisMarkPosition: AxisMarkPosition = .leading
    @State private var isVerticalChart = true
    
    @State private var chartType: ChartType = .line
    @State var title = "Chart Title"
    @State var titleAlignment: HorizontalAlignment = .leading
    var body: some View {
        VStack{
           
            
            
            HStack {
                
                LeftChartButtonsView(
                    barColors: $barColors,
                    chartType: $chartType,
                    isVerticalChart: $isVerticalChart
                )
                
                VStack(alignment: titleAlignment){
                    Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding(.vertical)
                    if isVerticalChart {
                                   
                      switch(chartType) {
                        case .bar:
                          BarChartVerticalView(dailySales: dailySales, barColors: barColors)
                        case .line:
                         LineChartVerticalView(dailySales: dailySales)
                        case .area:
                         AreaChartVerticalView(dailySales: dailySales)
                                   }
                                   
                                   
                    }else{
                       switch(chartType) {
                          case .bar:
                          BarChartHorizontalView(dailySales: dailySales, barColors: barColors)
                                       
                          case .line:
                          LineChartHorizontalView(dailySales: dailySales)
                          case .area:
                           AreaChartHorizontalView(dailySales: dailySales)
                                   }
                               }
                }
                
                
                RightChartButtonView(barColors: $barColors, chartType: $chartType, isVerticalChart: $isVerticalChart, titleAlignment: $titleAlignment)
            }
            
//            Chart {
//                ForEach(dailySales) { item in
//
//                    if isVerticalChart {
//                        switch(chartType) {
//                        case .bar:
//                            BarMark(x: .value("Day", item.day),
//                                    y:  .value("Sales", item.sales))
//                        case .line:
//                            LineMark(x: .value("Day", item.day),
//                                    y:  .value("Sales", item.sales))
//                        case .area:
//                            AreaMark(x: .value("Day", item.day),
//                                    y:  .value("Sales", item.sales))
//                        }
//                    }else{ //Horizontal gcase
//                        switch(chartType) {
//                        case .bar:
//                            BarMark(x: .value("Sales", item.sales),
//                                  y:  .value("Day", item.day))
//                        case .line:
//                            LineMark(x: .value("Sales", item.sales),
//                                   y:  .value("Day", item.day))
//                        case .area:
//                            AreaMark(x: .value("Sales", item.sales),
//                                   y:  .value("Day", item.day))
//                        }
//                    }
//
//
//
//
////                    .foregroundStyle(by: .value("Day", item.day))
//                }
//            }
        }
        .padding()
    }
}

#Preview {
    ContentView(dailySales: defaultDailySales, min: 0.0, max: 700.0)
}
