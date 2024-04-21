//
//  ContentView.swift
//  week2_seunghye
//
//  Created by 양승혜 on 4/21/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var timerElapsed: TimeInterval = 0
    @State private var isRunning = false
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var currentTab = 0
    
    var body: some View {
        VStack {
            TabView(selection: $currentTab) {
                VStack {
                    Text("\(timeString(time: timerElapsed))")
                        .font(.system(size: 90))
                        .fontWeight(.ultraLight)
                        .padding()
                        .foregroundColor(.white)
                        .offset(y: -50)
                }
                .tag(0)
                VStack {
                    Text("123")
                }
                .tag(1)
            }
            .tabViewStyle(PageTabViewStyle())
            
            HStack {
                Button(action: resetTimer) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                            .cornerRadius(100)
                            .overlay(
                                RoundedRectangle(cornerRadius: 100)
                                    .inset(by: 41)
                                    .stroke(Color(red: 0.19, green: 0.19, blue: 0.19), lineWidth: 82)
                            )
                        Text("랩")
                            .font(Font.custom("Inter", size: 22))
                            .foregroundColor(.white)
                    }
                }
                Spacer()
                if isRunning {
                    Button(action: stopTimer) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                                .cornerRadius(100)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 100)
                                        .inset(by: 41)
                                        .stroke(Color(red: 1, green: 0.27, blue: 0.24).opacity(0.27), lineWidth: 82)
                                )
                            Text("중단")
                                .font(Font.custom("Inter", size: 22))
                                .foregroundColor(.red)
                        }
                    }
                } else {
                    Button(action: startTimer) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                                .cornerRadius(100)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 100)
                                        .inset(by: 41)
                                        .stroke(Color(red: 0.27, green: 1, blue: 0.24).opacity(0.27), lineWidth: 82)
                                )
                            Text("시작")
                                .font(Font.custom("Inter", size: 22))
                                .foregroundColor(.green)
                        }
                    }
                }
            }
            .padding()
        }
        .frame(height: 400)
        .onReceive(timer) { _ in
            if self.isRunning {
                self.timerElapsed += 0.1
            }
        }
    }
    private func startTimer() {
        isRunning = true
    }
    private func stopTimer() {
        isRunning = false
    }
    private func resetTimer() {
        isRunning = false
        timerElapsed = 0
    }
    private func timeString(time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        let miliseconds = Int((time.truncatingRemainder(dividingBy: 1)) * 100)
        return String(format: "%02d:%02d.%02d", minutes, seconds, miliseconds)
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
