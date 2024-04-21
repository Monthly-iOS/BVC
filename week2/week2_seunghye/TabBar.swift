//
//  TabBar.swift
//  week2_seunghye
//
//  Created by 양승혜 on 4/21/24.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Text("World clock")
                .tabItem {
                    Image(systemName: "globe")
                    Text("세계 시계")
                }
            Text("Alarm")
                .tabItem {
                    Image(systemName: "alarm.fill")
                    Text("알람")
                }
            ContentView()
                .tabItem {
                    Image(systemName: "stopwatch.fill")
                    Text("스톱워치")
                }
            Text("Timer")
                .tabItem {
                    Image(systemName: "timer")
                    Text("타이머")
                }
        }
        .accentColor(.orange)
    }
}

#Preview {
    TabBar()
        .preferredColorScheme(.dark)
}
