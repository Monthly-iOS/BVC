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
    private let tickHeight: CGFloat = 8
    private let longTickHeight: CGFloat = 12
    private let tickWidth: CGFloat = 2
    private let numberPadding: CGFloat = 40
    private let miniTickHeight: CGFloat = 6
    private let miniLongTickHeight: CGFloat = 9
    private let miniNumberPadding: CGFloat = 24
    
    var body: some View {
        let miniWidth = width * 0.28
        let miniExtraMarginFromBottom = width * 0.07
        let miniNumberWidth = miniWidth - miniNumberPadding
        let numberWidth = width - numberPadding
        
        ZStack {
            //MARK: Mini Clock
            ClockView(count: 48,
                      longDivider: 2,
                      longTickHeigh: miniLongTickHeight,
                      tickHeight: miniTickHeight,
                      tickWidth: tickWidth,
                      highlightedColorDivider: 8,
                      highlightedColor: .clockHighlightedcolor,
                      normalColor: .clockNormalColor)
            .frame(width: miniWidth, height: miniWidth)
            .padding(.bottom, miniWidth + miniExtraMarginFromBottom)
            
            NumbersView(numbers: viewModel.getNumbers(count: 6),
                        font: .clockMiniText,
                        textColor: .clockTextColor)
            .frame(width: miniNumberWidth, height: miniNumberWidth)
            .padding(.bottom, miniWidth + miniExtraMarginFromBottom)
            
            NeedleView(width: 6,
                       height: miniWidth,
                       color: .needleNormalColor)
            .rotationEffect(.radians(Double.pi / 2))
            .padding(.bottom, miniWidth + miniExtraMarginFromBottom)
            
            //MARK: Normal Clock
            ClockView(count: 240,
                      longDivider: 4,
                      longTickHeigh: longTickHeight,
                      tickHeight: tickHeight,
                      tickWidth: tickWidth,
                      highlightedColorDivider: 20,
                      highlightedColor: .clockHighlightedcolor,
                      normalColor: .clockNormalColor)
            .frame(width: width, height: width)
            
            NumbersView(numbers: viewModel.getNumbers(count: 12),
                        font: .clockText,
                        textColor: .clockTextColor)
            .frame(width: numberWidth, height: numberWidth)
            
            Text(viewModel.totalFormattedTime)
                .font(.lapClockText)
                .foregroundStyle(Color.clockTextColor)
                .padding(.top, width * 0.36)
            
            if let currentLapDegree: Double = viewModel.currentLapDegree {
                NeedleView(width: 8,
                           height: width,
                           color: .needleCurrentLapColor,
                           bottomLineHeight: 30)
                .rotationEffect(.radians(currentLapDegree))
            }
            
            NeedleView(width: 8,
                       height: width,
                       color: .needleNormalColor,
                       bottomLineHeight: 30)
            .rotationEffect(.radians(viewModel.totalTimeDegree))
        }
    }
}
