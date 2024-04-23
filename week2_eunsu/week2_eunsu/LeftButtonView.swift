//
//  LeftButtonView.swift
//  week2_eunsu
//
//  Created by Eunsu JEONG on 4/23/24.
//

import SwiftUI

//TODO: 버튼 클릭에 따른 색상과 텍스트 변경 필요
struct LeftButtonView: View {
    let buttonText: String
    let textColor: Color
    let backgroundColor: Color
    
    var body: some View {
        Button {
            
        } label: {
            Text(buttonText)
                .font(.buttonText)
        }
        .buttonStyle(ActionButtonStyle(textColor: textColor,
                                       backgroundColor: backgroundColor))
    }
}
