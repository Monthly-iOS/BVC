//
//  ContentView.swift
//  week2_eunsu
//
//  Created by Eunsu JEONG on 4/23/24.
//

import SwiftUI

struct ContentView: View {
    private let horizontalMargin: CGFloat = 20
    private let verticalMargin: CGFloat = 60
    private let numberPadding: CGFloat = 40
    private let viewModel: ViewModel = ViewModel()
    @State var tabIndex = 0
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            
            GeometryReader { geo in
                let width = geo.size.width - (horizontalMargin * 2)
                let numberWidth = width - numberPadding
                
                VStack {
                    ZStack {
                        TabView(selection: $tabIndex) {
                            ClockTimerView(width: width, numberWidth: numberWidth)
                                .padding(.horizontal, horizontalMargin)
                                .padding(.top, -verticalMargin)
                            
                            NumberTimerView()
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                        
                        HStack {
                            ButtonView(buttonText: "Lap",
                                       textColor: .lapButtonTextColor,
                                       backgroundColor: .lapButtonColor)
                            
                            Spacer()
                            
                            ButtonView(buttonText: "Start",
                                       textColor: .startButtonTextColor,
                                       backgroundColor: .startButtonColor)
                        }
                        .padding(.top, width - verticalMargin / 2)
                    }
                    
                    List {
                        ForEach(viewModel.presenters) { item in
                            VStack(alignment: .leading, spacing: 12, content: {
                                Color.lapCellDividerColor
                                    .frame(width: geo.size.width, height: 1)
                            })
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
