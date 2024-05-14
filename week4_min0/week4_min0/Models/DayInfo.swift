//
//  DayInfo.swift
//  week4_min0
//
//  Created by 이민영 on 5/14/24.
//

import UIKit

struct DayInfo {
    let id: UUID = UUID()
    let day, weather, highTemp, lowTemp: String
    let weatherImg: UIImage
}

let weekInfo: [DayInfo] = [
    
    DayInfo(
        day: "Mon",
        weather: "Rainy",
        highTemp: "+20°",
        lowTemp: "+14°",
        weatherImg: UIImage(named: "rainy.png")!
    ),
    DayInfo(
        day: "The",
        weather: "Rainy",
        highTemp: "+22°",
        lowTemp: "+16°",
        weatherImg: UIImage(named: "rainy.png")!
    ),
    DayInfo(
        day: "Wed",
        weather: "Storm",
        highTemp: "+19°",
        lowTemp: "+14°",
        weatherImg: UIImage(named: "storm.png")!
    ),
    DayInfo(
        day: "Thu",
        weather: "Sun",
        highTemp: "+18°",
        lowTemp: "+12°",
        weatherImg: UIImage(named: "sun.png")!
    ),
    DayInfo(
        day: "Fri",
        weather: "Thunder",
        highTemp: "+23°",
        lowTemp: "+19°",
        weatherImg: UIImage(named: "thunder.png")!
    ),
    DayInfo(
        day: "Sat",
        weather: "Rainy",
        highTemp: "+25°",
        lowTemp: "+17°",
        weatherImg: UIImage(named: "rainy.png")!
    ),
    DayInfo(
        day: "Sun",
        weather: "Storm",
        highTemp: "+21°",
        lowTemp: "+18°",
        weatherImg: UIImage(named: "storm.png")!
    ),
    
    

]
