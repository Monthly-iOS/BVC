//
//  RightButtonView.swift
//  week2_eunsu
//
//  Created by Eunsu JEONG on 4/23/24.
//

import SwiftUI

struct RightButtonView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        Button {
            viewModel.rightButtonTapped()
        } label: {
            Text(viewModel.isLapStarted ? "Stop" : "Start")
                .font(.buttonText)
        }
        .buttonStyle(ActionButtonStyle(
            textColor: viewModel.isLapStarted ? .stopButtonTextColor : .startButtonTextColor,
            backgroundColor: viewModel.isLapStarted ? .stopButtonColor : .startButtonColor))
    }

}
