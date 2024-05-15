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
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentHorizontalAlignment = .leading
        return button
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var highTempLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 70, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.textColor = .white
        return label
    }()
    
    private lazy var lowTempLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.layer.opacity = 0.3
        return label
    }()
    
    private lazy var weather: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.layer.opacity = 0.3
        return label
    }()
    
    // 날짜, 온도
    private lazy var vStack1: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var windImage: UIImageView = {
        let imageView = UIImageView()
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var humidImage: UIImageView = {
        let imageView = UIImageView()
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var rainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var windLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var humidLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        
        return label
    }()
    
    private lazy var rainLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        
        return label
    }()
    
    private lazy var windTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.layer.opacity = 0.4
        return label
    }()
    
    private lazy var humidTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.layer.opacity = 0.4
        return label
    }()
    
    private lazy var rainTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.layer.opacity = 0.4
        return label
    }()
    
    private lazy var hStack1: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [highTempLabel, lowTempLabel])
        stackView.axis = .horizontal // vertical -> vstack
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 0
        stackView.alignment = .lastBaseline
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var hStack2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .lastBaseline
        stackView.distribution = .fill
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var hStack3: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var headerStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var vStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private lazy var vStackLeft: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [windImage, windLabel, windTitle])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var vStackCenter: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [humidImage, humidLabel, humidTitle])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var vStackRight: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [rainImage, rainLabel, rainTitle])
        stackView.axis = .vertical
        stackView.alignment = .center
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
        self.contentView.backgroundColor = .systemBlue
        self.contentView.layer.cornerRadius = 30.0
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        contentView.addSubview(containerView)
        containerView.addSubview(vStack)
        
        NSLayoutConstraint.activate([
            vStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
        
        // Tommorow & 20/17
        [title, hStack1, weather].forEach {
            vStack1.addArrangedSubview($0)
        }
        
        [weatherImageView, vStack1].forEach {
            hStack2.addArrangedSubview($0)
        }
        // wind, humid, rain
        [vStackLeft, vStackCenter, vStackRight].forEach {
            hStack3.addArrangedSubview($0)
        }
        
        [backButton].forEach {
            headerStack.addArrangedSubview($0)
        }
        headerStack.alignment = .leading
        
        [headerStack, hStack2, hStack3].forEach {
                   vStack.addArrangedSubview($0)
               }
    }
    
    private func bindCell(with item: NextState ) {
        title.text = "Tommorow"
        weather.text = item.weather
        weatherImageView.image = item.weatherImg
        highTempLabel.text = item.highTemp
        lowTempLabel.text = item.lowTemp
        windLabel.text = item.wind
        humidLabel.text = item.humidity
        rainLabel.text = item.chanceOfRain
        windImage.image = item.windImg
        humidImage.image = item.humidImg
        rainImage.image = item.chanceRainImg
        windTitle.text = "Wind"
        humidTitle.text = "Humidity"
        rainTitle.text = "Chance of rain"
    }
}
