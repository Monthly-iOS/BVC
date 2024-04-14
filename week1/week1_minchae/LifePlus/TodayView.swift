//
//  TodayView.swift
//  LifePlus
//
//  Created by 황민채 on 4/6/24.
//

import SwiftUI

struct TodayView: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(mainPhotoCard, id: \.self) { item in
                        NavigationLink {
                            TodayDetailView(image: item.imageName,
                                            title: item.title,
                                            subtTitle: item.subTitle)
                        } label: {
                            ZStack(alignment: .topLeading) {
                                PhotoCardFrame(image: item.imageName)
                                    .overlay(alignment: .bottomLeading) {
                                        VStack(alignment: .leading) {
                                            Text(item.title)
                                                .font(.title2)
                                                .foregroundStyle(.white)
                                                .fontWeight(.bold)
                                            
                                            Text(item.subTitle)
                                                .font(.footnote)
                                                .foregroundStyle(.white)
                                        }
                                        .padding()
                                    }
                                    .overlay(alignment: .bottomTrailing) {
                                        VStack {
                                            Text("+구독")
                                                .font(.caption)
                                                .padding(6)
                                                .foregroundStyle(.white)
                                                .background(
                                                    RoundedRectangle(cornerRadius: 15)
                                                        .stroke(lineWidth: 1.5)
                                                        .foregroundStyle(.white)
                                                )
                                        }
                                        .padding(15)
                                    }
                            }
                        }
                    }
                    .padding(.leading, 30)
                }
            }
            .padding(.top, 20)
            Spacer()
        }
    }
}

//MARK: - 포토카드 프레임
struct PhotoCardFrame: View {
    var image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.width * 0.75, height: UIScreen.main.bounds.height * 0.7)
            .clipped()
            .cornerRadius(5)
    }
}

#Preview {
    ContentView()
}
