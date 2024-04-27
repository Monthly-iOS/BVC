//
//  NumbersView.swift
//  week2_eunsu
//
//  Created by Eunsu JEONG on 4/23/24.
//

import SwiftUI

struct NumbersView: View {
    let numbers: [Int]
    let font: Font
    let textColor: Color
    
    var body: some View {
        ZStack {
            let degree = Double.pi * 2 / Double(numbers.count)
            
            ForEach(0..<numbers.count, id: \.self) { index in
                let itemDegree = degree * Double(index)
                
                VStack {
                    Text("\(numbers[index])")
                        .rotationEffect(.radians(-itemDegree))
                        .foregroundStyle(textColor)
                        .font(font)
                    
                    Spacer()
                }
                .rotationEffect(.radians(itemDegree))
            }
        }
    }
}
