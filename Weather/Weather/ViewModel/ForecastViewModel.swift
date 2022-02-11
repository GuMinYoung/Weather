//
//  ForecastViewModel.swift
//  Weather
//
//  Created by 구민영 on 2022/02/02.
//

import Foundation

class ForecastViewModel {
    var forecastList = [Forecast]()
    
    init() {}
    
    init(forecastList: [Forecast]) {
        self.forecastList = forecastList
    }
}
