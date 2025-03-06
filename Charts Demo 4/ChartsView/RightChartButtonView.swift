//
//  RightChartButtonView.swift
//  Charts Demo 4
//
//  Created by mehmet Çelik on 5.03.2025.
//

import SwiftUI

struct RightChartButtonView: View {
    @Binding var chartItem : ChartItem
    
    var body: some View {
        VStack(spacing: 50){
        
            Button(action: {
                withAnimation {
                    chartItem.isVerticalChart.toggle()
                }
            }, label: {
                Image(systemName: "chart.bar.fill")
                    .rotationEffect(.degrees(chartItem.isVerticalChart ?  90 : 0))
                    .foregroundColor(.black)
                    .opacity(0.7)
            })
            
            
            TitleAlignmentButton(titleAlignment: $chartItem.titleAlignment)
        }
        .padding()
    }
}

#Preview {
    HStack {
        Spacer()
        RightChartButtonView(chartItem: .constant(.defaultChartItem))
        
    }
}
