//
//  SimpleTitleButtonView.swift
//  Charts Demo 4
//
//  Created by mehmet Çelik on 6.03.2025.
//

import SwiftUI

struct SimpleTitleButtonView: View {
    @Binding var titleAlignment: HorizontalAlignment
    let myAlignment: HorizontalAlignment
    let iconName: String
    let selectedOpacity = 1.0
    let deSelectedOpacity = 0.3
    var body: some View {
        Button(action: {
            withAnimation {
                titleAlignment = myAlignment
            }
        }, label: {
            Image(systemName:iconName)
                .foregroundColor(.black)
                .opacity(titleAlignment == myAlignment ? selectedOpacity : deSelectedOpacity)
        })
    }
}


#Preview {
    VStack(spacing: 50) {
        SimpleTitleButtonView(titleAlignment: .constant(.center), myAlignment: .center, iconName: "align.horizontal.center.fill")
        SimpleTitleButtonView(titleAlignment: .constant(.center), myAlignment: .leading, iconName: "align.horizontal.left.fill")
      
    }
}
