//
//  TitleAlignmentButton.swift
//  Charts Demo 4
//
//  Created by mehmet Çelik on 6.03.2025.
//

import SwiftUI

struct TitleAlignmentButton: View {
    @Binding var titleAlignment: HorizontalAlignment
    
    
    
    let selectedOpacity = 1.0
    let deSelectedOpacity = 0.3
    var body: some View {
       
        VStack(spacing: 5) {
            
            SimpleTitleButtonView(titleAlignment: $titleAlignment, myAlignment: .leading, iconName: "align.horizontal.left.fill")
            
                
            SimpleTitleButtonView(titleAlignment: $titleAlignment, myAlignment: .center, iconName: "align.horizontal.center.fill")
            
            SimpleTitleButtonView(titleAlignment: $titleAlignment, myAlignment: .trailing, iconName: "align.horizontal.right.fill")
           
            
        }
        .padding(5)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(lineWidth: 0.3)
        )
        
        
    }
}


#Preview {
    TitleAlignmentButton(titleAlignment: .constant(.center))
}
