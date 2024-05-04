//
//  CollectionViewTableViewCell.swift
//  week3_eunsu
//
//  Created by Eunsu JEONG on 5/4/24.
//

import UIKit

///TableView의 각 행마다 CollectionView가 들어감
class CollectionViewTableViewCell: UITableViewCell {
    static let identifier = String(describing: CollectionViewTableViewCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
