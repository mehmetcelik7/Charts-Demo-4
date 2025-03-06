//
//  RuleMarkView.swift
//  Charts Demo 4
//
//  Created by mehmet Çelik on 6.03.2025.
//

import SwiftUI
import Charts

struct RuleMarkView: ChartContent {
    let selectedDay: String
    let salesOnSelectedDay: Double
    let intMode: Bool
    var precision: Int {
        intMode ? 0 : 1
    }
    let lineColor = Color.red
    var specifier: String {
        "%.\(precision)f"
    }
    var body: some ChartContent {
       
        RuleMark(y: .value("Sales", salesOnSelectedDay))
            .foregroundStyle(lineColor)
            .lineStyle(StrokeStyle(lineWidth: 2,dash: [5]))
            .annotation(position: .topTrailing, spacing: 0){
                Text("\(salesOnSelectedDay,specifier: specifier)")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }

    }
}

