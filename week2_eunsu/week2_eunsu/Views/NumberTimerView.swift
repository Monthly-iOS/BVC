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
            Text(viewModel.totalFormattedTime)
                .foregroundStyle(Color.clockTextColor)
                .font(.numberTimerText)
        }
        .padding(.bottom, 40)
    }
}

