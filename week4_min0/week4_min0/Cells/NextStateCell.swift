//
//  NextStateCell.swift
//  week4_min0
//
//  Created by 이민영 on 5/14/24.
//

import UIKit

class NextStateCell: UICollectionViewCell {
    static let identifier = "nextStateCell"
    
    var nextStateItem: NextState! {
        didSet {
            bindCell(with: nextStateItem)
        }
    }
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .systemGray2
        return label
    }()
    
    private lazy var weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
//        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var vStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical // vertical -> vstack
        stackView.alignment = .center
        stackView.distribution = .fill
        // 한 줄의 아이템 간의 간격
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .red
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.contentView.backgroundColor = .red
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        contentView.addSubview(containerView)
        containerView.addSubview(vStack)
        
        NSLayoutConstraint.activate([
            vStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            vStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:  16),
            vStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        [title, weatherImageView].forEach {
            vStack.addArrangedSubview($0)
        }
    }
    
    private func bindCell(with item: NextState ) {
        title.text = "Tommorow"
        weatherImageView.image = item.weatherImg
    }
}
