//
//  Charts_Demo_4App.swift
//  Charts Demo 4
//
//  Created by mehmet Çelik on 5.03.2025.
//

import SwiftUI

@main
struct Charts_Demo_4App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(dailySales: defaultDailySales, min: 0.0, max: 700.0, barColors: defaultBarColors)
        }
    }
}
