//
//  SnapCarousel.swift
//  week1
//
//  Created by 양승혜 on 4/7/24.
//
// 참고 : https://www.youtube.com/watch?v=4Gw5lDXJ04g

import SwiftUI

// for Accepting List
struct SnapCarousel<Content: View,T: Identifiable>: View {
    var content: (T) -> Content
    var list: [T]
    
    // Properties
    var spacing: CGFloat
    var trailingSpace: CGFloat
    @Binding var index: Int
    
    init(spacing: CGFloat = 15, trailingSpace: CGFloat = 100, index: Binding<Int>, items: [T], @ViewBuilder content: @escaping (T)->Content) {
        
        self.list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.content = content
    }
    
    @GestureState var offset: CGFloat = 0
    @State var currentIndex: Int = 0
    
    var body: some View {
        GeometryReader { proxy in
            
            // Setting correct width for snap Carousel
            
            // 한 쪽면만 왼쪽으로 딱 붙이게끔 설정
            let width = proxy.size.width - (trailingSpace - spacing)
            let adjustMentWidth = (trailingSpace / 2) - spacing
            
            HStack(spacing: spacing) {
                ForEach(list) { item in
                    content(item)
                        .frame(width: proxy.size.width - trailingSpace)
                }
            }
            .padding(.horizontal, spacing)
            // 0th index만 왼쪽으로 딱붙이고, 다른 인덱스는 중간에 오게끔
            .offset(x: (CGFloat(currentIndex) * -width) + (currentIndex != 0 ? adjustMentWidth: 0) + offset)
            .gesture(
                DragGesture()
                    .updating($offset, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onEnded({ value in
                        
                        // updating current index
                        let offsetX = value.translation.width
                        
                        // were going to convert the translation into progress (0 - 1)
                        // and round the value
                        // based on the progress increasing or decreasing the currentIndex
                        
                        let progress = -offsetX / width
                        
                        let roundIndex = progress.rounded()
                        
                        // setting min (끝까지 스크롤하면 뒤에 공간이 남는 문제발생)
                        currentIndex = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                        
                        // updating index
                        currentIndex = index
                    })
                    .onChanged({ value in
                        // updating current index
                        let offsetX = value.translation.width
                        
                        // were going to convert the translation into progress (0 - 1)
                        // and round the value
                        // based on the progress increasing or decreasing the currentIndex
                        
                        let progress = -offsetX / width
                        
                        let roundIndex = progress.rounded()
                        
                        // setting min (끝까지 스크롤하면 뒤에 공간이 남는 문제발생)
                        index = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)

                        
                    })
            )
        }
        // Animating when offset = 0
        .animation(.easeInOut, value: offset == 0)
    }
    
}

#Preview {
    ContentView()
}
