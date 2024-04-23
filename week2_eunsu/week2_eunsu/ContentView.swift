//
//  ContentView.swift
//  week2_eunsu
//
//  Created by Eunsu JEONG on 4/23/24.
//

import SwiftUI

struct ContentView: View {
    private let marginHorizontal: CGFloat = 14.5
    private let marginVertical: CGFloat = 13
    private let tickHeight: CGFloat = 8
    private let longTickHeight: CGFloat = 12
    private let tickWidth: CGFloat = 2
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            
            GeometryReader { geo in
                ZStack {
                    let width = geo.size.width - (marginHorizontal * 2)
                    
                    ClockView(count: 240,
                              longDivider: 4,
                              longTickHeigh: longTickHeight,
                              tickHeight: tickHeight,
                              tickWidth: tickWidth,
                              highlightedColorDivider: 20,
                              highlightedColor: .clockHighlightedcolor,
                              normalColor: .clockNormalColor)
                    .frame(width: width, height: width)
                }
                .padding(.horizontal, marginHorizontal)
                .padding(.top, marginVertical)
            }
        }
    }
}

#Preview {
    ContentView()
}
