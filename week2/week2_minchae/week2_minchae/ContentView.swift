//
//  ContentView.swift
//  week2_minchae
//
//  Created by 황민채 on 4/21/24.
//

import UIKit
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            WorldClockView()
                .tabItem {
                    Image(systemName: "network")
                    Text("세계 시계")
                }
            AlarmView()
                .tabItem {
                    Image(systemName: "alarm.fill")
                    Text("알람")
                }
            StopWatchView()
                .tabItem {
                    Image(systemName: "stopwatch.fill")
                    Text("스톱워치")
                }
            TimerView()
                .tabItem {
                    Image(systemName: "timer")
                    Text("타이머")
                }
        }
        .onAppear() {
            UITabBar.appearance().backgroundColor = .black
        }
        .accentColor(.orange)
    }
}

#Preview {
    ContentView()
}
