//
//  TodayDetailView.swift
//  LifePlus
//
//  Created by 황민채 on 4/6/24.
//

import SwiftUI

struct TodayDetailView: View {
    let image: String
    let title: String
    let subtTitle: String
    
    var body: some View {
        Image(image)
            .resizable()
    }
}

#Preview {
    ContentView()
}
