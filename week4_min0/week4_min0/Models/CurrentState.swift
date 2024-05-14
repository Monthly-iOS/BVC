//
//  CurrentState.swift
//  week4_min0
//
//  Created by 이민영 on 5/14/24.
//

import Foundation
import UIKit

struct CurrentState {
    let id = UUID()
    let temperature, weather, wind, humidity, chanceOfRain: String
    let windImg, humidImg, chanceRainImg: UIImage
}
