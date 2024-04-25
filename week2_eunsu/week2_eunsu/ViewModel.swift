//
//  ViewModel.swift
//  week2_eunsu
//
//  Created by Eunsu JEONG on 4/23/24.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var presenters: [LapItemPresenter] = []
    @Published var currentLapTime: String = "00:00.00"
    @Published var isLapStarted: Bool = false
    private var startDate: Date?
    private var timer: Timer?
    private var lapIndex: Int = 0
    private var lapTime: [Double] = []
    
    init() {
        presenters = []
        lapTime.append(0)
        currentLapTime = getFormattedString(0)
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
    
    func leftButtonTapped() {
        
    }
    
    func rightButtonTapped() {
        if isLapStarted {
            lapTime[lapIndex] += getTimeElapsed()
            timer?.invalidate() //메모리에서 타이머를 삭제
        } else {
            startDate = Date()
            updateRecords()
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [weak self] (_) in
                self?.updateCurrentLapTime()
            }
        }
        
        isLapStarted.toggle()
    }
    
    private func updateCurrentLapTime() {
        var timeElapsed: TimeInterval = 0
        
        timeElapsed = getTimeElapsed()
        timeElapsed += lapTime[lapIndex]
        currentLapTime = getFormattedString(timeElapsed)
        presenters[lapIndex].time = currentLapTime
    }
    
    private func getTimeElapsed() -> Double {
        guard let startDate = startDate else {
            return 0
        }
        
        return Date().timeIntervalSince1970 - startDate.timeIntervalSince1970
    }
    
    private func getFormattedString(_ timeElapsed: Double) -> String {
        var timeElapsed = timeElapsed
        
        let minutes: Int = Int(timeElapsed / 60)
        timeElapsed -= Double(minutes) * 60
        
        let seconds: Int = Int(timeElapsed)
        timeElapsed -= Double(seconds)
        
        let milliseconds = Int(timeElapsed * 100)
        
        return String(format: "%02d:%02d.%02d", minutes, seconds, milliseconds)
    }
}
