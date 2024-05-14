//
//  CurrentState.swift
//  week4_min0
//
//  Created by 이민영 on 5/14/24.
//

import Foundation
import UIKit

struct NextState {
    let id = UUID()
    let weatherImg: UIImage
    let highTemp, lowTemp, weather, wind, humidity, chanceOfRain: String
    let windImg, humidImg, chanceRainImg: UIImage
}

let tommorowItem: [NextState] = [
    NextState(
    weatherImg: UIImage(named: "rainy")!,
    highTemp: "20",
    lowTemp: "/17°",
    weather: "Rainy-Cloudy",
    wind: "9 km/h",
    humidity: "31%",
    chanceOfRain: "93%",
    windImg: UIImage(named: "wind_percent")!,
    humidImg: UIImage(named: "humid_percent")!,
    chanceRainImg: UIImage(named: "rain_percent")!
)]
