//
//  ActionButtonStyle.swift
//  week2_eunsu
//
//  Created by Eunsu JEONG on 4/23/24.
//

import SwiftUI

struct ActionButtonStyle: ButtonStyle {
    let textColor: Color
    let backgroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 90, height: 90)
            .background(
                Circle()
                    .foregroundStyle(backgroundColor)
                    .padding(4)
            )
            .foregroundStyle(textColor)
    }
}
