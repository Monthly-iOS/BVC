//
//  ViewModel.swift
//  week2_eunsu
//
//  Created by Eunsu JEONG on 4/23/24.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var lapRecords: [LapItemRecord] = []
    @Published var totalFormattedTime: String = ""
    @Published var isLapStarted: Bool = false
    @Published var leftButtonType: LeftButtonType = .lapPassive
    @Published var totalTimeDegree: Double = 0
    @Published var currentLapDegree: Double?
    private var startDate: Date?
    private var timer: Timer?
    private var lapIndex: Int = 0
    private var lapTimes: [Double] = []
    private var totalTimeElapsed: Double = 0
    
    init() {
        lapRecords = []
        lapTimes.append(0)
        totalFormattedTime = getFormattedString(0)
    }
    
    ///타이머에 5초 간격으로 표시될 시간 배열
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
        switch leftButtonType {
        case .lapPassive:
            ()
        case .lapActive:
            updateTimes()
            lapTimes.append(0)
            lapIndex += 1
            startDate = Date()
            updateRecords()
        case .reset:
            resetView()
        }
    }
    
    ///타이머를 시작 또는 중지시킴: 기존 랩의 시간을 업데이트
    func rightButtonTapped() {
        if isLapStarted {
            updateTimes()
            timer?.invalidate() //메모리에서 타이머를 삭제
            leftButtonType = .reset
        } else {
            startDate = Date()
            updateRecords()
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [weak self] (_) in
                self?.updateCurrentLapTime()
            }
            
            leftButtonType = .lapActive
        }
        
        isLapStarted.toggle()
    }
    
    ///leftButtonType의 상태에 따라 LeftButton의 텍스트와 색상 변경
    func getLeftButtonFeature() -> (String, Color, Color) {
        switch leftButtonType {
        case .lapPassive:
            return ("Lap", .lapButtonTextColor, .lapButtonColor)
        case .lapActive:
            return ("Lap", .resetButtonTextColor, .resetButtonColor)
        case .reset:
            return ("Reset", .resetButtonTextColor, .resetButtonColor)
        }
    }
    
    ///화면 초기화
    private func resetView() {
        leftButtonType = .lapPassive
        lapRecords = []
        startDate = nil
        timer = nil
        lapTimes = []
        lapTimes.append(0)
        lapIndex = 0
        totalFormattedTime = getFormattedString(0)
        totalTimeElapsed = 0
        totalTimeDegree = 0
        currentLapDegree = nil
    }
    
    ///총 측정 시간과 lapTimes의 현재 랩타임 값을 업데이트
    private func updateTimes() {
        let timeElapsed = getTimeElapsed()
        totalTimeElapsed += timeElapsed
        lapTimes[lapIndex] += timeElapsed
    }
    
    ///기존 랩 시간에 재시작 시간으로부터 시간이 얼마나 흘렀는지 계산한 값을 더해 화면에 보이는 시간을 업데이트
    private func updateCurrentLapTime() {
        var timeElapsed: TimeInterval = 0
        var lapTimeElapsed: TimeInterval = 0
        
        lapTimeElapsed = getTimeElapsed() + lapTimes[lapIndex]
        timeElapsed = getTimeElapsed() + totalTimeElapsed
        totalFormattedTime = getFormattedString(timeElapsed)
        lapRecords[0].time = getFormattedString(lapTimeElapsed)
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
    
    ///빈 lapRecords에 lapTimes 배열의 값을 추가한 다음 역순으로 전환
    private func updateRecords() {
        lapRecords = []
        
        for (index, lap) in lapTimes.enumerated() {
            lapRecords.append(LapItemRecord(lap: "Lap \(index + 1)",
                                               time: getFormattedString(lap),
                                               type: .normal))
        }
        
        lapRecords.reverse()
    }
}
