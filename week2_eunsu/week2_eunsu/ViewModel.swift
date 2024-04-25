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
    
    ///타이머에 5초 간격으로 표시되는 시간
    func getNumbers(count: Int) -> [Int] {
        var numbers: [Int] = []
        
        numbers.append(count * 5)
        
        for index in 1..<count {
            numbers.append(index * 5)
        }
        
        return numbers
    }
    
    ///기록에 따라 랩 텍스트 색을 변화
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
    
    ///타이머를 시작 또는 중지시킴: 기존 랩의 시간을 업데이트
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
    
    ///기존 랩 시간에 재시작 시간으로부터 시간이 얼마나 흘렀는지 계산한 값을 더해 랩을 업데이트
    private func updateCurrentLapTime() {
        var timeElapsed: TimeInterval = 0
        
        timeElapsed = getTimeElapsed()
        timeElapsed += lapTime[lapIndex]
        currentLapTime = getFormattedString(timeElapsed)
        presenters[lapIndex].time = currentLapTime
    }
    
    ///시작 시간으로부터 시간이 얼마나 흘렀는지 계산
    private func getTimeElapsed() -> Double {
        guard let startDate = startDate else {
            return 0
        }
        
        return Date().timeIntervalSince1970 - startDate.timeIntervalSince1970
    }
    
    ///00:00.00 형식으로 주어진 시간초를 변환
    private func getFormattedString(_ timeElapsed: Double) -> String {
        var timeElapsed = timeElapsed
        
        let minutes: Int = Int(timeElapsed / 60)
        timeElapsed -= Double(minutes) * 60
        
        let seconds: Int = Int(timeElapsed)
        timeElapsed -= Double(seconds)
        
        let milliseconds = Int(timeElapsed * 100)
        
        return String(format: "%02d:%02d.%02d", minutes, seconds, milliseconds)
    }
    
    private func updateRecords() {
        presenters = []
        for (index, lap) in lapTime.enumerated() {
            presenters.append(LapItemPresenter(lap: "Lap \(index + 1)",
                                               time: getFormattedString(lap),
                                               type: .normal))
        }
    }
}
