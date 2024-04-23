//
//  ClockTimerView.swift
//  week2_eunsu
//
//  Created by Eunsu JEONG on 4/23/24.
//

import SwiftUI

struct ClockTimerView: View {
    @ObservedObject var viewModel: ViewModel
    let width: CGFloat
    let numberWidth: CGFloat
    private let tickHeight: CGFloat = 8
    private let longTickHeight: CGFloat = 12
    private let tickWidth: CGFloat = 2
    
    var body: some View {
        ZStack {
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
            
            NeedleView(width: 8,
                       height: width,
                       color: .needleNormalColor,
                       bottomLineHeight: 30)
            .rotationEffect(.radians(Double.pi / 2))
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
