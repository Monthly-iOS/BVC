//
//  ClockView.swift
//  week2_eunsu
//
//  Created by Eunsu JEONG on 4/23/24.
//

import SwiftUI

struct ClockView: View {
    let count: Int
    let longDivider: Int
    let longTickHeigh: CGFloat
    let tickHeight: CGFloat
    let tickWidth: CGFloat
    
    var body: some View {
        let degree = Double.pi * 2 / Double(count)
        
        ZStack {
            ForEach(0..<count, id: \.self) { index in
                let height = (index % longDivider == 0) ? longTickHeigh : tickHeight
                
                TickShape(tickShape: height)
                    .stroke(lineWidth: tickWidth)
                    .rotationEffect(.radians(degree * Double(index)))
                    .foregroundColor(.white)
            }
        }
    }
}
