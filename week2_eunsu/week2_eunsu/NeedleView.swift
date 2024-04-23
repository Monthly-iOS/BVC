//
//  NeedleView.swift
//  week2_eunsu
//
//  Created by Eunsu JEONG on 4/23/24.
//

import SwiftUI

struct NeedleView: View {
    let width: CGFloat
    let height: CGFloat
    let color: Color
    var bottomLineHeight: CGFloat? //작은 시계에는 필요하지 않음
    
    var body: some View {
        let lineWidth: CGFloat = width / 4
        
        VStack(spacing: 0) {
            Rectangle()
                .fill(color)
                .frame(width: lineWidth, height: height / 2)
            
            RoundedRectangle(cornerRadius: .infinity)
                .stroke(color, lineWidth: lineWidth)
                .frame(width: width, height: width)
            
            if let bottomLineHeight = bottomLineHeight {
                Rectangle()
                    .fill(color)
                    .frame(width: lineWidth, height: bottomLineHeight)
            }
            
            Spacer()
        }
        .frame(width: width, height: height)
    }
}
