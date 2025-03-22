//
//  WeekCell.swift
//  week4_min0
//
//  Created by 이민영 on 5/14/24.
//

import UIKit

class WeekCell: UICollectionViewCell {
    static let identifier = "dayInfoCell"
    
    var dayInfoCellItem: Day! {
        didSet {
            bindCell(with: dayInfoCellItem)
        }
    }
    
    private lazy var dayLabel: UILabel = {
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
        imageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var weather: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .systemGray2
        return label
    }()
    
    private lazy var highTempLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.textColor = .white
        return label
    }()
    
    private lazy var lowTempLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray2
        return label
    }()
    
    private lazy var hStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal // vertical -> vstack
        stackView.alignment = .center
        stackView.distribution = .fill
        // 한 줄의 아이템 간의 간격
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var subStack1: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        // 한 줄의 아이템 간의 간격
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var subStack2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 0
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
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        contentView.addSubview(containerView)
        containerView.addSubview(hStack)
        
        NSLayoutConstraint.activate([
            hStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            hStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            hStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:  16),
            hStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        [weatherImageView, weather].forEach {
            subStack1.addArrangedSubview($0)
        }
        [highTempLabel, lowTempLabel].forEach {
            subStack2.addArrangedSubview($0)
        }
        [dayLabel, subStack1, subStack2].forEach { hStack.addArrangedSubview($0) }
    }
    
    private func bindCell(with item: Day) {
        dayLabel.text = item.day
        weatherImageView.image = item.weatherImg
        weather.text = item.weather
        highTempLabel.text = item.highTemp
        lowTempLabel.text = item.lowTemp
    }
}


#if DEBUG
import SwiftUI
struct FeaturedAppsCollectionView: UIViewRepresentable {
    typealias UIViewType = UIView
    func makeUIView(context: Context) -> UIView {
        let cell = WeekCell()
        cell.dayInfoCellItem = weekInfo.first!
        return cell
    }
    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct FeaturedAppsCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedAppsCollectionView()
            .edgesIgnoringSafeArea(.all)
            .previewLayout(.fixed(width: 300, height: 200))
    }
}
#endif
