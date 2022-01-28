//
//  City.swift
//  Weather
//
//  Created by 구민영 on 2022/01/27.
//

import Foundation
import UIKit

// MARK: - Welcome
struct CityData: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int
    let message: Double
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}

// MARK: - Custom Data
struct City {
    var name: String
    var temp: Double
    var humidity: Int
    //var iconId: String
    var weatherImage: UIImage?
    
    init() {
        self.name = ""
        self.temp = 0
        self.humidity = 0
        //self.iconId = ""
        self.weatherImage = nil
    }
    
    init(name: String, temp: Double, humidity: Int, iconId: String) {
        self.name = name
        self.temp = temp
        self.humidity = humidity
        //self.iconId = iconID
        self.weatherImage = UIImage(named: "http://openweathermap.org/img/wn/\(iconId)@2x.png")
    }
}
