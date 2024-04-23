//
//  RightButtonView.swift
//  week2_eunsu
//
//  Created by Eunsu JEONG on 4/23/24.
//

import SwiftUI

struct RightButtonView: View {
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
