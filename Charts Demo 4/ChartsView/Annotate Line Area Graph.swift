//
//  Annotate Line Area Graph.swift
//  Charts Demo 4
//
//  Created by mehmet Çelik on 7.03.2025.
//

import SwiftUI

struct Annotate_Line_Area_Graph: View {
    let charItem: ChartItem
    
    
    var body: some View {
        VStack{
            if charItem.editMode {
                Image(systemName: "square.and.pencil")
                    .foregroundColor(charItem.lineAreaColor)
                    .padding(3)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(charItem.lineAreaColor)
                    )
                    .opacity(0.7)
            }else{
                Circle()
                    .fill(charItem.lineAreaColor)
                    .frame(width: 7, height: 7)
            }
        }
    }
}

#Preview {
    Annotate_Line_Area_Graph(charItem: .defaultChartItem)
}
