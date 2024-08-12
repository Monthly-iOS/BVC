//
//  ViewController.swift
//  week4_ciu
//
//  Created by 강치우 on 5/8/24.
//

import UIKit
import SnapKit

class WeatherViewController: UIViewController {
    
    lazy var menuButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.grid.3x3.fill"), for: .normal)
        button.tintColor = .white
        button.layer.opacity = 0.9
        button.frame.size = CGSize(width: 30, height: 30)
        return button
    }()
    
    lazy var minskLabel: UILabel = {
        let label = UILabel()
        label.text = "Minsk"
        label.textAlignment = .center
        label.layer.opacity = 0.9
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 24)
        label.frame.size = CGSize(width: 100, height: 30)
        return label
    }()
    
    lazy var updateLabel: UILabel = {
        let label = UILabel()
        label.text = "Updating"
        label.textAlignment = .center
        label.layer.opacity = 0.8
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    lazy var threeDotButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .white
        button.layer.opacity = 0.9
        button.frame.size = CGSize(width: 30, height: 30)
        return button
    }()
    
    lazy var menuStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [menuButton, minskLabel, threeDotButton])
        stack.axis = .horizontal
        stack.spacing = (self.view.frame.width - 140) / 2
        return stack
    }()
    
    lazy var minskStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [menuStack, updateLabel])
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()
    
    lazy var blueBackgroundView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 40
        return view
    }()
    
    lazy var greenBackgroundView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.alpha = 0.5
        view.layer.cornerRadius = 30
        return view
    }()
    
    lazy var rainImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "cloud.rain.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        return imageView
    }()
    
    lazy var temperLabel = {
        let label = UILabel()
        label.text = "21"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 120)
        return label
    }()
    
    lazy var weatherLabel = {
        let label = UILabel()
        label.text = "Rainy"
        label.textAlignment = .center
        label.textColor = .white
        label.layer.opacity = 0.8
        label.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        return label
    }()
    
    lazy var weekendLabel = {
        let label = UILabel()
        label.text = "Monday, 17 May"
        label.textAlignment = .center
        label.textColor = .white
        label.layer.opacity = 0.5
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()

    lazy var todayLabel: UILabel = {
        let label = UILabel()
        label.text = "Today"
        label.textAlignment = .left
        label.textColor = .white
        label.font = .systemFont(ofSize: 22, weight: .medium)
        return label
    }()
    
    lazy var sevenDayButton: UIButton = {
        let button = UIButton()
        button.setTitle("7 days >", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.contentHorizontalAlignment = .trailing
        button.layer.opacity = 0.4
        return button
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let width: CGFloat = self.view.frame.width / 4 - 24
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: width, height: 100)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    lazy var divider = {
        let divider = UIView()
        divider.backgroundColor = .white
        divider.layer.opacity = 0.1
        return divider
    }()
    
    lazy var windIcon = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "wind")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.opacity = 0.8
        imageView.tintColor = .white
        return imageView
    }()
    
    lazy var windKm: UILabel = {
        let label = UILabel()
        label.text = "9km/h"
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .heavy)
        return label
    }()
    
    lazy var windLabel: UILabel = {
        let label = UILabel()
        label.text = "Wind"
        label.textAlignment = .center
        label.textColor = .white
        label.layer.opacity = 0.6
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    lazy var windStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [windIcon, windKm, windLabel])
        stack.axis = .vertical
        stack.spacing = 4
        return stack
    }()
    
    lazy var humidityIcon = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "humidity.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.opacity = 0.8
        imageView.tintColor = .white
        return imageView
    }()
    
    lazy var humidityPer: UILabel = {
        let label = UILabel()
        label.text = "31%"
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .heavy)
        return label
    }()
    
    lazy var humidityLabel: UILabel = {
        let label = UILabel()
        label.text = "Humidity"
        label.textAlignment = .center
        label.textColor = .white
        label.layer.opacity = 0.6
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    lazy var humidityStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [humidityIcon, humidityPer, humidityLabel])
        stack.axis = .vertical
        stack.spacing = 4
        return stack
    }()
    
    lazy var chanceIcon = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "water.waves")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.opacity = 0.8
        imageView.tintColor = .white
        return imageView
    }()
    
    lazy var chancePer: UILabel = {
        let label = UILabel()
        label.text = "95%"
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .heavy)
        return label
    }()
    
    lazy var chanceLabel: UILabel = {
        let label = UILabel()
        label.text = "Chance of rain"
        label.textAlignment = .center
        label.textColor = .white
        label.layer.opacity = 0.6
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    lazy var chanceStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [chanceIcon, chancePer, chanceLabel])
        stack.axis = .vertical
        stack.spacing = 4
        return stack
    }()
    
    lazy var infomationStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [windStack, humidityStack, chanceStack])
        stack.axis = .horizontal
        stack.spacing = (self.view.frame.width - 260) / 3
        return stack
    }()
    
    var delegate: Update?
    
    var temperList: [Temper] = [
        Temper(temper: "21", image: "cloud.rain.fill", weather: "Rainy", wind: "9km/h", humidity: "31%", chanceOfRain: "95%", isSelect: true),
        Temper(temper: "30", image: "sun.max.fill", weather: "Hot", wind: "3km/h", humidity: "23%", chanceOfRain: "3%", isSelect: false),
        Temper(temper: "22", image: "cloud.rain.fill", weather: "Cold", wind: "12km/h", humidity: "12%", chanceOfRain: "65%", isSelect: false),
        Temper(temper: "35", image: "sun.max.fill", weather: "Hot", wind: "2km/h", humidity: "23%", chanceOfRain: "12%", isSelect: false),
        Temper(temper: "21", image: "moon.fill", weather: "Slow", wind: "1km/h", humidity: "24%", chanceOfRain: "43%", isSelect: false),
        Temper(temper: "22", image: "cloud.fill", weather: "Slow", wind: "6km/h", humidity: "17%", chanceOfRain: "23%", isSelect: false),
        Temper(temper: "15", image: "cloud.drizzle.fill", weather: "Cold", wind: "11km/h", humidity: "34%", chanceOfRain: "76%", isSelect: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(WeatherViewCell.self, forCellWithReuseIdentifier: WeatherViewCell.identifier)
        self.collectionView.showsHorizontalScrollIndicator = false
        
        self.view.backgroundColor = .black
        
        self.view.addSubview(self.blueBackgroundView)
        self.view.addSubview(self.greenBackgroundView)
        self.view.addSubview(self.todayLabel)
        self.view.addSubview(self.sevenDayButton)
        self.view.addSubview(self.collectionView)
        self.blueBackgroundView.addSubview(self.minskStack)
        self.view.sendSubviewToBack(self.greenBackgroundView)

        
        blueBackgroundView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalToSuperview().offset(-200)
        }
        
        greenBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(blueBackgroundView.snp.bottom).offset(-20)
            make.bottom.equalTo(blueBackgroundView.snp.bottom).offset(10)
            make.leading.equalTo(blueBackgroundView.snp.leading).offset(20)
            make.trailing.equalTo(blueBackgroundView.snp.trailing).offset(-20)
        }
        
        todayLabel.snp.makeConstraints { make in
            make.top.equalTo(greenBackgroundView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(30)
        }
        
        sevenDayButton.snp.makeConstraints { make in
            make.top.equalTo(greenBackgroundView.snp.bottom).offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(todayLabel.snp.bottom).offset(-20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.snp.bottom)
        }
        
        minskStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(60)
        }
        
        self.blueBackgroundView.addSubview(self.rainImageView)
        self.blueBackgroundView.addSubview(self.temperLabel)
        self.blueBackgroundView.addSubview(self.weatherLabel)
        self.blueBackgroundView.addSubview(self.weekendLabel)
        self.blueBackgroundView.addSubview(self.divider)
        self.blueBackgroundView.addSubview(self.infomationStack)
        
        rainImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(200)
        }
        
        temperLabel.snp.makeConstraints { make in
            make.top.equalTo(rainImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(110)
        }
        
        weatherLabel.snp.makeConstraints { make in
            make.top.equalTo(temperLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
        weekendLabel.snp.makeConstraints { make in
            make.top.equalTo(weatherLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(20)
        }
        
        divider.snp.makeConstraints { make in
            make.top.equalTo(weekendLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(1)
        }
        
        infomationStack.snp.makeConstraints { make in
            make.top.equalTo(divider.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
    }
}

extension WeatherViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    // Cell의 표시할 데이터를 띄워주는 메서드
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherViewCell", for: indexPath) as? WeatherViewCell else { return UICollectionViewCell() }
        
        cell.temperLabel.text = temperList[indexPath.row].temper
        cell.imageView.image = UIImage(systemName: temperList[indexPath.row].image)
        cell.imageView.contentMode = .scaleAspectFit
        
        if temperList[indexPath.row].isSelect {
            cell.blueBackgroundView.backgroundColor = .systemBlue.withAlphaComponent(1.2)
        } else {
            cell.blueBackgroundView.backgroundColor = .clear
            cell.blueBackgroundView.layer.borderWidth = 0.4
            cell.blueBackgroundView.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
        }
        
        return cell
    }
    
    // Cell의 갯수를 결정하는 메서드
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return temperList.count
    }
    
    // Cell 클릭할 때 메서드
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.update(indexPath: indexPath)
    }
}

extension WeatherViewController: Update {
    func update(indexPath: IndexPath) {
        if let index = temperList.firstIndex(where: { $0.isSelect == true }) {
            temperList[index].isSelect = false
            temperList[indexPath.row].isSelect = true
        }
        
        self.rainImageView.image = UIImage(systemName: temperList[indexPath.row].image)
        self.temperLabel.text = temperList[indexPath.row].temper
        self.weatherLabel.text = temperList[indexPath.row].weather
        self.windKm.text = temperList[indexPath.row].wind
        self.humidityPer.text = temperList[indexPath.row].humidity
        self.chancePer.text = temperList[indexPath.row].chanceOfRain
        
        self.collectionView.reloadData()
    }
}
