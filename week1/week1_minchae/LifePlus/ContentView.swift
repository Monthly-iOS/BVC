//
//  ContentView.swift
//  LifePlus
//
//  Created by 황민채 on 4/6/24.
//

import SwiftUI

enum tapItem: String, CaseIterable { // CaseIterable: case들을 배열처럼 순회할 수 있도록 하는 프로토콜
    case Today = "TODAY"
    case Discover = "DISCOVER"
}

struct ContentView: View {
    @State private var selectedPicker: tapItem = .Today
    @Namespace private var animation
    
    var body: some View {
        VStack {
            HStack {
                animate()
                
                Button {
                    // TODO: 햄버거버튼 액션 구현
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .foregroundStyle(.black)
                        .font(.title)
                }
                .padding(.leading, 100)
                .padding(.trailing, 20)
            }
            Homeview(tap: selectedPicker)
        }
    }
    
    @ViewBuilder
    private func animate() -> some View {
        HStack {
            ForEach(tapItem.allCases, id: \.self) { item in
                VStack {
                    Text(item.rawValue)
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity/4, minHeight: 50)
                        .foregroundColor(selectedPicker == item ? .black : .gray)
                    
                    if selectedPicker == item {
                        Capsule()
                            .foregroundColor(.black)
                            .frame(width: 20, height: 4)
                            .matchedGeometryEffect(id: "info", in: animation)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedPicker = item
                    }
                }
            }
        }
    }
}

struct Homeview: View {
    var tap: tapItem
    
    var body: some View {
        switch tap {
        case .Today:
            NavigationStack {
                TodayView()
            }
        case .Discover:
            DiscoverView()
        }
    }
}

#Preview {
    ContentView()
}
