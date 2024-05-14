//
//  WeatherViewControllerImp.swift
//  week4_ciu
//
//  Created by 강치우 on 5/15/24.
//

import UIKit

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
