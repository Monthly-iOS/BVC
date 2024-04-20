//
//  StopWatchView.swift
//  week2_minchae
//
//  Created by 황민채 on 4/21/24.
//

import SwiftUI

struct StopWatchView: View {
    @State private var currentTab = 0
    @State private var counter: Double = 0.0
    @State private var timerRunning = false
    @State private var timer: Timer.TimerPublisher = Timer.publish(every: 0.01, on: .main, in: .common)
    @State private var arr: [Timer] = []
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            VStack {
                TabView(selection: $currentTab,
                        content:  {
                    VStack {
                        Text(String(format: "%.2f", counter))
                            .font(.largeTitle)
                            .padding()
                            .onReceive(timer.autoconnect().makeConnectable().autoconnect()) { _ in
                                if self.timerRunning {
                                    self.counter += 0.01
                                }
                            }
                            .foregroundStyle(Color.white)
                    }
                    .tag(0)
                    
                    VStack {
                        Text("매일 19시부터 알림 배송")
                            .foregroundStyle(Color.white)
                    }
                    .tag(1)
                    
                })
                .tabViewStyle(PageTabViewStyle())
                .frame(height: 300)
                HStack {
                    Button {
                        self.counter = 0.0
                    } label: {
                        VStack{
                            Text("재설정")
                                .foregroundStyle(Color.white)
                        }
                        .frame(width: 70, height: 70)
                        .background(Circle()
                            .fill(Color.gray.opacity(0.2))
                        )
                    }
                    .padding()
                    
                    Spacer()
                    
                    Button {
                        self.timerRunning.toggle()
                    } label: {
                        VStack{
                            Text(timerRunning ? "중단" : "시작")
                                .foregroundStyle(timerRunning ? Color.red : Color.green)
                        }
                        .frame(width: 70, height: 70)
                        .background(Circle()
                            .fill(timerRunning ? Color.red.opacity(0.2) : Color.green.opacity(0.2) )
                        )
                        
                    }
                    .padding()
                }
                .padding()
                VStack {
                    Text("이제 여기에 랩")
                        .foregroundStyle(Color.white)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    StopWatchView()
}
