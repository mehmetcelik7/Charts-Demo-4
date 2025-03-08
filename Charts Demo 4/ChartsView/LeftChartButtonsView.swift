//
//  ChartButtonsView.swift
//  Charts Demo 4
//
//  Created by mehmet Çelik on 5.03.2025.
//

import SwiftUI

struct LeftChartButtonsView: View {
    @Binding var chartItem: ChartItem
//    @Binding var barColors: [Color]
//    @Binding var chartType: ChartType
//    @Binding var isVerticalChart : Bool
    
    var body: some View {
        VStack{
        
           
                              
                              
            Spacer()
            Button(action: {
                withAnimation {
                    chartItem.chartType = .bar
                }
            }, label: {
                Text("Bar")
                    .font(.title)

            })
            Spacer()
            Button(action: {
                withAnimation {
                    chartItem.chartType = .line
                }
            }, label: {
                Text("Line")
                    .font(.title)

            })
            Spacer()
            Button(action: {
                withAnimation {
                    chartItem.chartType = .area
                }
            }, label: {
                Text("Area")
                    .font(.title)

            })
            Spacer()
            
            ColorfulButtonView(chartItem: $chartItem,
                               dim: 49,
                               offset: 10, action:  {   })

        }
        .padding()
    }
}

#Preview {
    HStack {
        LeftChartButtonsView(chartItem: .constant(.defaultChartItem))
        Spacer()
        
    }
}
