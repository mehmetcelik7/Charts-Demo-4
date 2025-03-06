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
    
    @State var chartItem: ChartItem = .defaultChartItem
    
    let xAxisMarkPosition: AxisMarkPosition = .bottom
    let yAxisMarkPosition: AxisMarkPosition = .leading

    var body: some View {
        VStack{
            
            HStack {
                Button(action: {
                    withAnimation {
                        chartItem.editMode.toggle()
                    }
                }, label: {
                    Image(systemName:  chartItem.editMode ? "checkmark" :"square.and.pencil")
                })
               
                if !chartItem.editMode {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            //TODO: Sharing
                        }
                    }, label: {
                        Image(systemName: "square.and.arrow.up" )
                    })
                }
            }
           
            
            
            HStack {
                
                if  chartItem.editMode{
                    LeftChartButtonsView(
                        chartItem: $chartItem
                    )
                }
            
                
                VStack(alignment: chartItem.titleAlignment){
                    Text(chartItem.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding(.vertical)
                    if chartItem.isVerticalChart {
                                   
                        switch(chartItem.chartType) {
                        case .bar:
                          BarChartVerticalView(chartItem: $chartItem)
                        case .line:
                            LineChartVerticalView(chartItem: $chartItem)
                        case .area:
                         AreaChartVerticalView(chartItem: $chartItem)
                                   }
                                   
                                   
                    }else{
                        switch(chartItem.chartType) {
                          case .bar:
                          BarChartHorizontalView(chartItem: $chartItem)
                                       
                          case .line:
                          LineChartHorizontalView(chartItem: $chartItem)
                          case .area:
                           AreaChartHorizontalView(chartItem: $chartItem)
                                   }
                               }
                }
                
                if chartItem.editMode {
                    
                    RightChartButtonView(chartItem: $chartItem)
                }
               
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
    ContentView()
}
