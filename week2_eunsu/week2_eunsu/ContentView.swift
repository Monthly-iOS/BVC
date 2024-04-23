//
//  ContentView.swift
//  week2_eunsu
//
//  Created by Eunsu JEONG on 4/23/24.
//

import SwiftUI

struct ContentView: View {
    private let horizontalMargin: CGFloat = 20
    private let verticalMargin: CGFloat = 10
    private let tickHeight: CGFloat = 8
    private let longTickHeight: CGFloat = 12
    private let tickWidth: CGFloat = 2
    private let numberPadding: CGFloat = 40
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            
            GeometryReader { geo in
                ZStack {
                    let width = geo.size.width - (horizontalMargin * 2)
                    let numberWidth = width - numberPadding
                    
                    ClockView(count: 240,
                              longDivider: 4,
                              longTickHeigh: longTickHeight,
                              tickHeight: tickHeight,
                              tickWidth: tickWidth,
                              highlightedColorDivider: 20,
                              highlightedColor: .clockHighlightedcolor,
                              normalColor: .clockNormalColor)
                    .frame(width: width, height: width)
                    
                    NumbersView(numbers: getNumbers(count: 12),
                                font: .clockText,
                                textColor: .clockTextColor)
                    .frame(width: numberWidth, height: numberWidth)
                }
                .padding(.horizontal, horizontalMargin)
                .padding(.top, verticalMargin)
            }
            
            VStack {
                HStack {
                    ButtonView(buttonText: "Lap",
                               textColor: .lapButtonTextColor,
                               backgroundColor: .lapButtonColor)
                    
                    Spacer()
                    
                    ButtonView(buttonText: "Start",
                               textColor: .startButtonTextColor,
                               backgroundColor: .startButtonColor)
                }
            }
        }
    }
    
    private func getNumbers(count: Int) -> [Int] {
        var numbers: [Int] = []
        
        numbers.append(count * 5)
        
        for index in 1..<count {
            numbers.append(index * 5)
        }
        
        return numbers
    }
}

#Preview {
    ContentView()
}
