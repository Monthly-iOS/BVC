//
//  DiscoverView.swift
//  LifePlus
//
//  Created by 황민채 on 4/6/24.
//

import SwiftUI

enum discoverTapItem: String, CaseIterable { // CaseIterable: case들을 배열처럼 순회할 수 있도록 하는 프로토콜
    case item1 = "취미발견"
    case item2 = "오늘경제"
    case item3 = "여행추천"
    case item4 = "건강꿀팁"
    case item5 = "일상힐링"
}

enum filterTapItem: String, CaseIterable { // CaseIterable: case들을 배열처럼 순회할 수 있도록 하는 프로토콜
    case recent = "최신순"
    case views = "조회순"
}

struct DiscoverView: View {
    @State private var selectedPicker: discoverTapItem = .item1
    @Namespace private var animation
    
    var body: some View {
        VStack {
            animate()
                .padding()
            ScrollView {
                DiscoverDetailView(tap: selectedPicker)
            }
        }
    }
    
    @ViewBuilder
    private func animate() -> some View {
        HStack {
            ForEach(discoverTapItem.allCases, id: \.self) { item in
                VStack {
                    Text(item.rawValue)
                        .font(.callout)
                        .frame(maxWidth: .infinity/4, minHeight: 50)
                        .foregroundColor(selectedPicker == item ? .black : .gray)
                    
                    if selectedPicker == item {
                        Capsule()
                            .foregroundColor(.black)
                            .frame(width: 50, height: 3)
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

#Preview {
    DiscoverView()
}

struct DiscoverDetailView: View {
    var tap: discoverTapItem
    
    var body: some View {
        switch tap {
        case .item1:
            HobbyView()
        case .item2:
            HobbyView()
        case .item3:
            HobbyView()
        case .item4:
            HobbyView()
        case .item5:
            HobbyView()
        }
    }
}

struct HobbyView: View {
    @State private var selectedPicker: filterTapItem = .recent
    @Namespace private var animation
    
    var body: some View {
        VStack {
            Image("pp1")
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 1, height: 200)
                .overlay(alignment: .bottomLeading) {
                    Text("멋진 홈 오피스가 필요해\n선배's 어드바이스")
                        .foregroundStyle(.white)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding()
                }
        }
        animate()
        HobbyDetailView(tap: selectedPicker)
    }
    
    @ViewBuilder
    private func animate() -> some View {
        HStack {
            ForEach(filterTapItem.allCases, id: \.self) { item in
                Text(item.rawValue)
                    .font(.footnote)
                    .frame(maxWidth: .infinity/4, minHeight: 50)
                    .foregroundColor(selectedPicker == item ? .black : .gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            self.selectedPicker = item
                        }
                    }
            }
            Image(systemName: "square.stack.3d.down.right")
                .padding(.leading, 200)
        }
        .padding(.horizontal, 15)
    }
}

struct HobbyDetailView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var tap: filterTapItem
    
    var body: some View {
        switch tap {
        case .recent:
            LazyVGrid(columns: columns) {
                  ForEach(gridPhotoCard, id: \.self) { item in
                      VStack(alignment: .leading) {
                          Image(item.imageName)
                              .resizable()
                              .frame(width: 165, height: 165)
                              .cornerRadius(5)
                              .padding(.horizontal, 5)
                          
                          VStack(alignment: .leading) {
                              Text(item.title)
                                  .font(.callout)
                                  .fontWeight(.medium)
                              
                              Text(item.subTitle)
                                  .foregroundStyle(.gray)
                                  .font(.caption2)
                                  .fontWeight(.semibold)
                          }
                          .padding(.horizontal, 5)
                          .padding(.bottom, 15)
                      }
                  }
                }
            .padding(.horizontal, 15)
        case .views:
            LazyVGrid(columns: columns) {
                  ForEach(gridPhotoCard, id: \.self) { item in
                      Image(item.imageName)
                          .resizable()
                          .frame(width: 170, height: 170)
                          .cornerRadius(5)
                  }
                }
        }
    }
}

#Preview {
    HobbyDetailView(tap: .recent)
}
