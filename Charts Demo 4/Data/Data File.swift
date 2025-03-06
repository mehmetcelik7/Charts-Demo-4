//
//  Data File.swift
//  Charts Demo 3
//
//  Created by mehmet Çelik on 5.03.2025.
//

import Foundation
import SwiftUI

struct DailySalesType: Identifiable {
    let id = UUID()
    let day: String
    let sales: Double
    
    
}

func getSalesOfSelectedDay(dailySales: [DailySalesType],selectedDay: String) -> Double {
    if let i = dailySales.firstIndex(where: {$0.day == selectedDay}) {
        return dailySales[i].sales
    }else{
        return 0
    }
}


func setSalesOfSelectedDay(dailySales:  inout [DailySalesType], selectedDay: String, sales: Double, min: Double, max: Double) {
    if let i = dailySales.firstIndex(where: {$0.day == selectedDay}) {
        var newSales: Double
        if sales <= min {
            newSales = min
        }else if sales >= max {
            newSales = max
        }else{
            newSales = sales
        }
        dailySales[i] = DailySalesType(day: dailySales[i].day, sales: newSales)
    }
}

let defaultDailySales: [DailySalesType] = [
    .init(day: "Sun", sales: 429),
    .init(day: "Mon", sales: 320),
    .init(day: "Tues", sales: 30),
    .init(day: "Wed", sales: 150),
    .init(day: "Thu", sales: 220),
    .init(day: "Fri", sales: 80)

]

let defaultBarColors: [Color] = [
    .darkCyan,
    .blue,
    .orange,
    .green,
    .yellow,
    .purple,
    .red
]
