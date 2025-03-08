//
//  MainViewWithTitleAndBorder.swift
//  Charts Demo 4
//
//  Created by mehmet Çelik on 8.03.2025.
//

import SwiftUI

struct MainViewWithTitleAndBorder: View {
    @State var chartItem: ChartItem = .defaultChartItem
    @State var editTitle: Bool = false
    var borderColor: Color {
        .black
        .opacity(chartItem.showBorder ? 1.0 : 0.0)
    }
    
    var body: some View {
        VStack {
            
            
            HStack {
                Button(action: {
                    withAnimation {
                        chartItem.editMode.toggle()
                    }
                }, label: {
                    Image(systemName:  chartItem.editMode ? "checkmark" :"square.and.pencil")
                })
               
                if !chartItem.editMode {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            //TODO: Sharing
                        }
                    }, label: {
                        Image(systemName: "square.and.arrow.up" )
                    })
                }
            }
            .padding(.top)

               
                HStack {
                    
                    if  chartItem.editMode{
                        LeftChartButtonsView(
                            chartItem: $chartItem
                        )
                    }
                    VStack(alignment: chartItem.titleAlignment) {
                        
                        if !editTitle {
                            Text(chartItem.title)
                                .font(.headline)
                                .fontWeight(.semibold)
                                .onTapGesture {
                                    editTitle.toggle()
                                }
                        }else {
                            TextField(chartItem.title, text: $chartItem.title)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .onSubmit {
                                    editTitle.toggle()
                                }
                        }
                        
                        
                        ContentView(chartItem: $chartItem)
                          
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(borderColor)
                    )
                    .padding()
                    
                    
                    if chartItem.editMode {
                        
                        RightChartButtonView(chartItem: $chartItem)
                    }
                   
                }
                
            }
            
        
    }
       
    
}

#Preview {
    MainViewWithTitleAndBorder()
}
