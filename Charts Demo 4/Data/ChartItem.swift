//
//  ChartItem.swift
//  Charts Demo 4
//
//  Created by mehmet Çelik on 6.03.2025.
//

import Foundation
import SwiftUI
struct ChartItem: Identifiable {
    let id = UUID()
    var dailySales: [DailySalesType]
    var barColors: [Color]
    var editMode: Bool
    var selectedDay: String
    var min: Double
    var max: Double
    var title: String
    var titleAlignment: HorizontalAlignment
    var chartType: ChartType
    var isVerticalChart: Bool
    var intMode: Bool
    var lineAreaColor: Color
    var showBorder: Bool
    
    static let defaultChartItem: ChartItem = .init(
        dailySales: defaultDailySales,
        barColors: defaultBarColors,
        editMode: false,
        selectedDay: "Wed",
        min: 0,
        max: 1000,
        title: "Happy New Year",
        titleAlignment: .leading,
        chartType: .bar,
        isVerticalChart: true,
        intMode: true,
        lineAreaColor: .purple,
        showBorder: true
    
    )
}

//    @State var barColors: [Color] = defaultBarColors
//    @State private var isVerticalChart = true
//    @State var selectedDay: String = "Sun"
//    @State private var chartType: ChartType = .bar
//    @State var title = "Chart Title"
//    @State var titleAlignment: HorizontalAlignment = .leading
//    @State var editMode: Bool = false
