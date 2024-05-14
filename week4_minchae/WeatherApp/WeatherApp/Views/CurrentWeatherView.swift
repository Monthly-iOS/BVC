//
//  CurrentWeatherView.swift
//  WeatherApp
//
//  Created by 황민채 on 5/14/24.
//

import UIKit

final class CurrentWeatherView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
