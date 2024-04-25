//
//  LeftButtonView.swift
//  week2_eunsu
//
//  Created by Eunsu JEONG on 4/23/24.
//

import SwiftUI

enum LeftButtonType {
    case lapPassive, lapActive, reset
}

struct LeftButtonView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        Button {
            viewModel.leftButtonTapped()
        } label: {
            Text(viewModel.getLeftButtonFeature().0)
                .font(.buttonText)
        }
        .buttonStyle(ActionButtonStyle(textColor: viewModel.getLeftButtonFeature().1,
                                       backgroundColor: viewModel.getLeftButtonFeature().2))
    }
}
