//
//  Home.swift
//  week1
//
//  Created by 양승혜 on 4/7/24.
//

import SwiftUI

struct Home: View {
    
    @State var currentIndex: Int = 0
    
    @State var posts: [Post] = []
    
    var body: some View {
        VStack(spacing: 15) {
            VStack(alignment: .trailing, spacing: 12) {
                Image(systemName: "line.3.horizontal")
                .font(.title.bold())
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding()
            
//            VStack(alignment: .leading, spacing: 12) {
//                Button {
//                    
//                } label: {
//                    Label {
//                        Text("Back")
//                            .fontWeight(.semibold)
//                    } icon: {
//                        Image(systemName: "line.3.horizontal")
//                            .font(.title2.bold())
//                    }
//                    .foregroundColor(.primary)
//                }
//                Text("My Wishes")
//                    .font(.title)
//                    .fontWeight(.black)
//                
//            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .padding()
            
            
            
            
            // snap carousel, 사진 사이사이 spacing
            SnapCarousel(index: $currentIndex, items: posts) {
                post in
                
                GeometryReader { proxy in
                    
                    let size = proxy.size
                    
                    Image(post.postImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width)
                        .cornerRadius(4)
                }
            }
            // 사진 크기 줄임
            .padding(.vertical, 40)
            
            // 점들
            HStack(spacing: 10) {
                
                ForEach(posts.indices, id: \.self) { index in
                    Circle()
                        .fill(Color.black.opacity(currentIndex == index ? 1 : 0.1))
                        .frame(width: 10, height: 10)
                        //.scaleEffect(currentIndex == index ? 1.4 : 1)
                        .animation(.spring(), value: currentIndex == index)
                        
                }
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .onAppear {
            for index in 1...7 {
                posts.append(Post(postImage: "post\(index)"))
            }
        }
    }
}


#Preview {
    Home()
}
