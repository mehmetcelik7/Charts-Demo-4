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
    let sales: Int
    
    
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
