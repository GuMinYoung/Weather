//
//  DetailWeather.swift
//  Weather
//
//  Created by 구민영 on 2022/01/31.
//

import Foundation
import UIKit

struct DetailWeather {
    var name: String?               // 도시이름
    var weatherImageUrl: String?    // 날씨아이콘
    var curTemp: Double?            // 현재기온
    var description: String?        // 날씨설명
    var humidity: Int?              // 습도
    var feelsLike: Double?          // 체감기온
    var tempMin: Double?            // 최저기온
    var tempMax: Double?            // 최고기온
    var pressure: Int?              // 기압
    var windSpeed: Double?          // 풍속
    
    init() {
        self.name = ""
        self.weatherImageUrl = ""
        self.curTemp = 0
        self.description = ""
        self.humidity = 0
        self.feelsLike = 0
        self.tempMin = 0
        self.tempMax = 0
        self.pressure = 0
        self.windSpeed = 0
    }
    
    init(name: String, iconId: String, curTemp: Double, description: String, humidity: Int, feelsLike: Double, tempMin: Double, tempMax: Double, pressure: Int, windSpeed: Double) {
        self.name = name
        self.weatherImageUrl = "https://openweathermap.org/img/wn/\(iconId)@2x.png"
        self.curTemp = curTemp
        self.description = description
        self.humidity = humidity
        self.feelsLike = feelsLike
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.pressure = pressure
        self.windSpeed = windSpeed
    }
}
