//
//  RightChartButtonView.swift
//  Charts Demo 4
//
//  Created by mehmet Çelik on 5.03.2025.
//

import SwiftUI

struct RightChartButtonView: View {
    @Binding var barColors: [Color]
    @Binding var chartType: ChartType
    @Binding var isVerticalChart : Bool
    @Binding var titleAlignment: HorizontalAlignment
    var body: some View {
        VStack(spacing: 50){
        
            Button(action: {
                withAnimation {
                    isVerticalChart.toggle()
                }
            }, label: {
                Image(systemName: "chart.bar.fill")
                    .rotationEffect(.degrees(isVerticalChart ?  90 : 0))
                    .foregroundColor(.black)
                    .opacity(0.7)
            })
            
            
            TitleAlignmentButton(titleAlignment: $titleAlignment)
        }
        .padding()
    }
}

#Preview {
    HStack {
        Spacer()
        RightChartButtonView(
            barColors: .constant(defaultBarColors),
            chartType: .constant(.bar),
            isVerticalChart: .constant(true), titleAlignment: .constant(.center)
        )
        
    }
}
