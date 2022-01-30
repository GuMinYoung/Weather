//
//  City.swift
//  Weather
//
//  Created by 구민영 on 2022/01/27.
//

import Foundation

struct City {
    var name: String?
    var temp: Double?
    var humidity: Int?
    var weatherImageUrl: String?
    
    init() {
        self.name = ""
        self.temp = 0
        self.humidity = 0
        self.weatherImageUrl = ""
    }
    
    init(name: String, temp: Double, humidity: Int, iconId: String) {
        self.name = name
        self.temp = temp
        self.humidity = humidity
        self.weatherImageUrl = "https://openweathermap.org/img/wn/\(iconId)@2x.png"

    }
}
