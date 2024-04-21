//
//  TimerViewModel.swift
//  week2_seunghye
//
//  Created by 양승혜 on 4/21/24.
//

import SwiftUI
import Combine

class TimerViewModel: ObservableObject {
    @Published var remainingTime: TimeInterval = 60
    var timer: Timer?
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _
            in
            guard let self = self else { return }
            if self.remainingTime > 0 {
                self.remainingTime -= 1
            } else {
                self.stopTimer()
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
