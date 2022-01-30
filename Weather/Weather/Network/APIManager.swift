//
//  APIManager.swift
//  Weather
//
//  Created by KSNetDev1 on 2022/01/28.
//

import Foundation

protocol APIManager {}

extension APIManager {
    static func curWeatherUrl(_ cityId: Int) -> String {
        return "https://api.openweathermap.org/data/2.5/weather?id=\(cityId)&appid=b055d6bb700a0b449c6429337a17c28f"
    }
    
    static func forecastUrl(_ cityId: Int) -> String  {
        return "https://api.openweathermap.org/data/2.5/forecast?id=\(cityId)&appid=b055d6bb700a0b449c6429337a17c28f"
    }
}
