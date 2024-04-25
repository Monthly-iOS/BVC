//
//  NumberTimerView.swift
//  week2_eunsu
//
//  Created by Eunsu JEONG on 4/23/24.
//

import SwiftUI

struct NumberTimerView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.currentLapTime)
                .foregroundStyle(Color.clockTextColor)
                .font(.numberTimerText)
        }
        .padding(.bottom, 40)
    }
}

