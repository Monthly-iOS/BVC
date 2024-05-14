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
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1/2))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // item을 포함하는 group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(500))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

        return section
        
    }
    
    static func weekSection() -> NSCollectionLayoutSection? {
        // item, layout에 사이즈 설정해야 나옴
        // one item size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1/3))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // item을 포함하는 group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(500))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
    
}
