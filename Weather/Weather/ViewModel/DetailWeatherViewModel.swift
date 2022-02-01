//
//  DetailWeatherViewModel.swift
//  Weather
//
//  Created by 구민영 on 2022/01/31.
//

import Foundation

protocol DetailWeatherViewModelCoordinatorlDelegate: AnyObject {
  func forecast()
}

class DetailWeatherViewModel {
    let cityInfo: City
    weak var coordinatorDelegate: DetailWeatherViewModelCoordinatorlDelegate?
    
    init(city info: City) {
        self.cityInfo = info
    }
    
    func forecastClicked() {
      self.coordinatorDelegate?.forecast()
    }
}
