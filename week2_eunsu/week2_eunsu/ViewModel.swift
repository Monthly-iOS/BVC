//
//  ViewModel.swift
//  week2_eunsu
//
//  Created by Eunsu JEONG on 4/23/24.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var presenters: [LapItemPresenter] = []
    @Published var currentLapTime: String = "helloo"
    
    init() {
        self.presenters = [
            LapItemPresenter(lap: "Lap 1", time: "00:02,85", type: .normal),
            LapItemPresenter(lap: "Lap 2", time: "00:03,32", type: .normal),
            LapItemPresenter(lap: "Lap 3", time: "00:01,80", type: .best),
            LapItemPresenter(lap: "Lap 4", time: "00:05,17", type: .worst),
            LapItemPresenter(lap: "Lap 5", time: "00:04,24", type: .normal)
        ]
    }
    
    func getNumbers(count: Int) -> [Int] {
        var numbers: [Int] = []
        
        numbers.append(count * 5)
        
        for index in 1..<count {
            numbers.append(index * 5)
        }
        
        return numbers
    }
    
    func getLapTextColor(_ type: LapType) -> Color {
        switch type {
        case .normal:
            return .lapTypeNormalTextColor
        case .best:
            return .lapTypeBestTextColor
        case .worst:
            return .lapTypeWorstTextColor
        }
    }
}
