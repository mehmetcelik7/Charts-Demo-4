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
        
            ColorfulButtonView(colors: $barColors, dim: 30,
                          offset: 10, action:  {   })
                              
                              
            Spacer()
            Button(action: {
                withAnimation {
                    chartType = .bar
                }
            }, label: {
                Text("Bar")
            })
            Spacer()
            Button(action: {
                withAnimation {
                    chartType = .line
                }
            }, label: {
                Text("Line")
            })
            Spacer()
            Button(action: {
                withAnimation {
                    chartType = .area
                }
            }, label: {
                Text("Area")
            })
            Spacer()
            Button(action: {
                withAnimation {
                    isVerticalChart.toggle()
                }
            }, label: {
                Image(systemName: "chart.bar.fill")
                    .rotationEffect(.degrees(isVerticalChart ?  90 : 0))
            })
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
    .previewInterfaceOrientation(.landscapeRight)
}
