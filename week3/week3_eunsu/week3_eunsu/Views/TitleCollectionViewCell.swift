//
//  TitleCollectionViewCell.swift
//  week3_eunsu
//
//  Created by Eunsu JEONG on 5/6/24.
//

import UIKit

class TitleCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: TitleCollectionViewCell.self)
    private let posterImageView: UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    private func setUI() {
        contentView.addSubview(posterImageView)
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.clipsToBounds = true
        posterImageView.layer.cornerRadius = 3
    }
    
    func configure(with imageURL: String) {
        Task {
            do {
                posterImageView.image = try await tmdbAPI.shared.fetchImage(url: imageURL)
            }
        }
    }
}
