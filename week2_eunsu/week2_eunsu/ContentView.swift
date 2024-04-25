//
//  ContentView.swift
//  week2_eunsu
//
//  Created by Eunsu JEONG on 4/23/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: ViewModel = ViewModel()
    private let horizontalMargin: CGFloat = 20
    private let verticalMargin: CGFloat = 60
    private let numberPadding: CGFloat = 40
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            
            GeometryReader { geo in
                let width = geo.size.width - (horizontalMargin * 2)
                let numberWidth = width - numberPadding
                
                VStack {
                    ZStack {
                        TabView() {
                            ClockTimerView(viewModel: viewModel,
                                           width: width,
                                           numberWidth: numberWidth)
                                .padding(.horizontal, horizontalMargin)
                                .padding(.top, -verticalMargin)
                            
                            NumberTimerView(viewModel: viewModel)
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                        
                        HStack {
                            LeftButtonView(viewModel: viewModel)
                            
                            Spacer()
                            
                            RightButtonView(viewModel: viewModel)
                        }
                        .padding(.top, width - verticalMargin / 2)
                    }
                    
                    List {
                        ForEach(viewModel.lapRecords) { item in
                            VStack(alignment: .leading, spacing: 12) {
                                Color.lapCellDividerColor
                                    .frame(width: geo.size.width, height: 1)
                                
                                HStack() {
                                    let color = viewModel.getLapTextColor(item.type)
                                    
                                    Text(item.lap)
                                        .foregroundStyle(color)
                                        .font(.lapListText)
                                    
                                    Spacer()
                                    
                                    Text(item.time)
                                        .foregroundStyle(color)
                                        .font(.lapListText)
                                }
                                .padding(.horizontal, horizontalMargin)
                            }
                        }
                        .listRowBackground(Color.backgroundColor)
                    }
                    .padding(.top, -30)
                    .scrollContentBackground(.hidden)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
