//
//  CityListViewController.swift
//  Weather
//
//  Created by 구민영 on 2022/01/27.
//

import UIKit

class CityListViewController: UIViewController {
    @IBOutlet weak var cityTableView: UITableView!
    private var cityWeatherListVM = CityWeatherListViewModel()
    let cityWeatherService = CityWeatherService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "도시 별 날씨"
        cityTableView.delegate = self
        cityTableView.dataSource = self
        cityWeatherService.fetchCurWeather { cities in
            guard let cities = cities else {return}
            self.cityWeatherListVM = CityWeatherListViewModel(cities: cities)
            DispatchQueue.main.async {
                self.cityTableView.reloadData()
            }
        }
    }
}

extension CityListViewController: UITableViewDelegate {
    
}

extension CityListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cityWeatherListVM.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as? CityTableViewCell else {
            return UITableViewCell()
        }
        
        cell.update(cityWeatherListVM.city(at: indexPath.row))
        return cell
    }
}
