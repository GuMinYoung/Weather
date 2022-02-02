//
//  CityWeatherViewModel.swift
//  Weather
//
//  Created by 구민영 on 2022/01/28.
//

import Foundation

protocol CityListViewModelCoordinatorDelegate: AnyObject {
    func selectCity(info: City)
}

class CityListViewModel {
    var cities = [City]()
    weak var coordinatorDelegate: CityListViewModelCoordinatorDelegate?
    
    init(cities: [City]) {
        self.cities = cities.sorted {
            guard let lhs = $0.name,
                  let rhs = $1.name else {return true}
            return lhs < rhs
        }
    }
    
    init() {}
}

extension CityListViewModel {
    var numberOfSections: Int {
        return 1
    }

    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.cities.count
    }

    func city(at index: Int) -> City {
        return self.cities[index]
    }
    
    func selectRow(row: Int) {
        let city = self.cities[row]
        
        self.coordinatorDelegate?.selectCity(info: city)
    }
}
