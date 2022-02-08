//
//  CityCoordinator.swift
//  Weather
//
//  Created by 구민영 on 2022/01/31.
//

import Foundation
import UIKit

protocol CityListCoordinatorDelegate: AnyObject {
    func didFinishCityListCordinator(coordinator: Coordinator, city info: City)
  }

class CityCoordinator: BaseCoordinator {
    private let navigationController: UINavigationController
    weak var delegate: CityListCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
      self.navigationController = navigationController
    }
    
    override func start() {
        if let vc = self.cityListVC {
            self.navigationController.setViewControllers([vc], animated: false)
        }
        
        var viewModel = CityListViewModel()
        
        CityListService.shared.fetchCityList { cities in
            guard let cities = cities else {return}
            
            viewModel = CityListViewModel(cities: cities)
            viewModel.coordinatorDelegate = self
            
            DispatchQueue.main.async {
                guard let vc = self.cityListVC else {return}
                vc.viewModel = viewModel
                vc.cityTableView.reloadData()
            }
        }
    }
    
    lazy var cityListVC: CityListViewController? = {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CityListViewController") as? CityListViewController
        return vc
    }()
    
//    lazy var detailWeatherVC: DetailWeatherViewController? = {
//        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailWeatherViewController") as? DetailWeatherViewController
//        return vc
//    }()
}

extension CityCoordinator: CityListViewModelCoordinatorDelegate {
    func selectCity(info: City) {
//        if let vc = self.detailWeatherVC {
//          self.navigationController.pushViewController(vc, animated: true)
//        }
        self.delegate?.didFinishCityListCordinator(coordinator: self, city: info)
    }
}
