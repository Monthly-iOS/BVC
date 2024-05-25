//
//  Day.swift
//  week4_min0
//
//  Created by 이민영 on 5/14/24.
//

import UIKit

struct Day {
    let id: UUID = UUID()
    let day, weather, highTemp, lowTemp: String
    let weatherImg: UIImage
}

let weekInfo: [Day] = [
    Day(
        day: "Mon",
        weather: "Rainy",
        highTemp: "+20°",
        lowTemp: "+14°",
        weatherImg: UIImage(named: "rainy")!
    ),
    Day(
        day: "The",
        weather: "Rainy",
        highTemp: "+22°",
        lowTemp: "+16°",
        weatherImg: UIImage(named: "rainy.png")!
    ),
    Day(
        day: "Wed",
        weather: "Storm",
        highTemp: "+19°",
        lowTemp: "+14°",
        weatherImg: UIImage(named: "storm.png")!
    ),
    Day(
        day: "Thu",
        weather: "Sun",
        highTemp: "+18°",
        lowTemp: "+12°",
        weatherImg: UIImage(named: "sun.png")!
    ),
    Day(
        day: "Fri",
        weather: "Thunder",
        highTemp: "+23°",
        lowTemp: "+19°",
        weatherImg: UIImage(named: "thunder.png")!
    ),
    Day(
        day: "Sat",
        weather: "Rainy",
        highTemp: "+25°",
        lowTemp: "+17°",
        weatherImg: UIImage(named: "rainy.png")!
    ),
    Day(
        day: "Sun",
        weather: "Storm",
        highTemp: "+21°",
        lowTemp: "+18°",
        weatherImg: UIImage(named: "storm.png")!
    ),
]
