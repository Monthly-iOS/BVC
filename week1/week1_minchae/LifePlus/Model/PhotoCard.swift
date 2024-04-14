//
//  PhotoCard.swift
//  LifePlus
//
//  Created by 황민채 on 4/6/24.
//

import Foundation

struct PhotoCard: Identifiable, Equatable, Hashable {
    var id: String = UUID().uuidString
    var imageName: String
    var title: String
    var subTitle: String
}

var mainPhotoCard: [PhotoCard] = [
    PhotoCard(imageName: "pp2", title: "너를 위해 준비했어. 발렌타인데이 스팟 5", subTitle: "주말에 뭐하지? by ZUMO"),
    PhotoCard(imageName: "pp1", title: "집을 호텔처럼, 럭셔리 타월 선배's 어드바이스", subTitle: "취미생활 뭐하지?"),
    PhotoCard(imageName: "pp3", title: "캠핑 매트리스 추천! 초경량 에어매트 비교", subTitle: "쫄깃한 아웃도어 라이프"),
    PhotoCard(imageName: "pp1", title: "집을 호텔처럼, 럭셔리 타월 선배's 어드바이스", subTitle: "주말에 뭐하지? by ZUMO"),
    PhotoCard(imageName: "pp2", title: "너를 위해 준비했어. 발렌타인데이 스팟 5", subTitle: "주말에 뭐하지? by ZUMO")
]

var gridPhotoCard: [PhotoCard] = [
    PhotoCard(imageName: "pp1", title: "집을 호텔처럼, 럭셔리 타월 선배's 어드바이스", subTitle: "쫄깃한 아웃도어 라이프"),
    PhotoCard(imageName: "pp3", title: "캠핑 매트리스 추천! 초경량 에어매트 비교", subTitle: "취미생활 뭐하지"),
    PhotoCard(imageName: "pp2", title: "너를 위해 준비했어. 발렌타인데이 스팟 5", subTitle: "쫄깃한 아웃도어 라이프"),
    PhotoCard(imageName: "pp3", title: "캠핑 매트리스 추천! 초경량 에어매트 비교", subTitle: "취미생활 뭐하지"),
    PhotoCard(imageName: "pp1", title: "너를 위해 준비했어. 발렌타인데이 스팟 5", subTitle: "주말에 뭐하지? by ZUMO")
]
