//
//  WeatherViewCell.swift
//  week4_ciu
//
//  Created by 강치우 on 5/12/24.
//

import UIKit
import SnapKit

class WeatherViewCell: UICollectionViewCell {
    static let identifier = "WeatherViewCell"
    
    // Cell에 들어갈 요소들 선언
    var blueBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        return view
    }()
    
    lazy var temperLabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
    
    var imageView: UIImageView = {
        let img = UIImageView()
        img.tintColor = .white
        img.layer.borderWidth = 0
        img.layer.masksToBounds = true
        return img
    }()
    
    lazy var clockLabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
   // 초기화 (Cell안의 요소들을 부모 뷰에 포함 및 layout 설정)
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(self.blueBackgroundView)
        
        blueBackgroundView.addSubview(self.temperLabel)
        blueBackgroundView.addSubview(self.imageView)
        blueBackgroundView.addSubview(self.clockLabel)
        
        blueBackgroundView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview().offset(10)
        }
        
        temperLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(30)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(self.temperLabel.snp.bottom).offset(4)
            make.bottom.equalToSuperview().offset(-20)
            make.leading.equalTo(temperLabel.snp.leading)
            make.trailing.equalTo(temperLabel.snp.trailing)
        }
    }

    // Cell을 디코딩할 때 호출되는 메서드
    // UIColletionViewCell을 상속하므로 필수 구현
    // 인코딩/디코딩에 관련된 동작이 필요하지 않을 경우 fatalError를 호출하여 구현되지 않았음을 나타냄
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Cell이 재사용될 때 호출되는 메서드
    override func prepareForReuse() {
        super.prepareForReuse()
        self.blueBackgroundView.backgroundColor = nil
        self.imageView.image = nil
    }
}
