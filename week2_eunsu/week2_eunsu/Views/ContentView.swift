//
//  ContentView.swift
//  week2_eunsu
//
//  Created by Eunsu JEONG on 4/23/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: ViewModel = ViewModel()
    private let horizontalMargin: CGFloat = 40
    private let verticalMargin: CGFloat = 48
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            
            GeometryReader { geo in
                let width = geo.size.width - (horizontalMargin * 0.8)
                
                VStack {
                    ZStack {
                        TabView() {
                            NumberTimerView(viewModel: viewModel)
                            
                            ClockTimerView(viewModel: viewModel,
                                           width: width)
                            .padding(.top, -verticalMargin)
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                        
                        HStack {
                            LeftButtonView(viewModel: viewModel)
                            
                            Spacer()
                            
                            RightButtonView(viewModel: viewModel)
                        }
                        .padding(.top, width - verticalMargin * 0.4)
                        .padding(.horizontal, horizontalMargin / 10)
                    }
                    
                    Color.lapCellDividerColor
                        .frame(width: width, height: 1)
                    
                    List {
                        ForEach(viewModel.lapRecords) { item in
                            VStack(alignment: .leading, spacing: 12) {
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
                                .padding(.horizontal, horizontalMargin / 2)
                                
                                Color.lapCellDividerColor
                                    .frame(width: geo.size.width, height: 1)
                            }
                        }
                        .listRowBackground(Color.backgroundColor)
                        .listStyle(.plain)
                    }
                    .padding(.top, -38)
                    .padding(.horizontal, -horizontalMargin * 0.25)
                    .scrollContentBackground(.hidden)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
