//
//  ChartButtonsView.swift
//  Charts Demo 4
//
//  Created by mehmet Çelik on 5.03.2025.
//

import SwiftUI

struct LeftChartButtonsView: View {
    @Binding var barColors: [Color]
    @Binding var chartType: ChartType
    @Binding var isVerticalChart : Bool
    
    var body: some View {
        VStack{
        
           
                              
                              
            Spacer()
            Button(action: {
                withAnimation {
                    chartType = .bar
                }
            }, label: {
                Text("Bar")
                    .font(.title)

            })
            Spacer()
            Button(action: {
                withAnimation {
                    chartType = .line
                }
            }, label: {
                Text("Line")
                    .font(.title)

            })
            Spacer()
            Button(action: {
                withAnimation {
                    chartType = .area
                }
            }, label: {
                Text("Area")
                    .font(.title)

            })
            Spacer()
            
            ColorfulButtonView(colors: $barColors, dim: 49,
                          offset: 10, action:  {   })

        }
        .padding()
    }
}

#Preview {
    HStack {
        LeftChartButtonsView(
            barColors: .constant(defaultBarColors),
            chartType: .constant(.bar),
            isVerticalChart: .constant(true)
        )
        Spacer()
        
    }
}
