//
//  CompositionalLayoutSection.swift
//  week4_min0
//
//  Created by 이민영 on 5/14/24.
//

import Foundation
import UIKit

class CompositionalLayoutSection {
    static func tommorowSection() -> NSCollectionLayoutSection? {
        // one item size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // item을 포함하는 group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.4))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

        return section
        
    }
    
    static func weekSection() -> NSCollectionLayoutSection? {
        // item, layout에 사이즈 설정해야 나옴
        // one item size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1/7))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // item을 포함하는 group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.6))
        // group -> vertical 로 item vStack 처럼 쌓기
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(-10)
        
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
    
}
