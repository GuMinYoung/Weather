//
//  CityCoordinator.swift
//  Weather
//
//  Created by 구민영 on 2022/01/31.
//

import Foundation
import UIKit

protocol CityListCoordinatorDelegate: AnyObject {
    func didFinishCityListCordinator(coordinator: Coordinator, with city:City)
  }

class CityCoordinator: BaseCoordinator {
    private let navigationController: UINavigationController
    weak var delegate: CityListCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
      self.navigationController = navigationController
    }
    
    override func start() {
        var viewModel = CityListViewModel()
        CityListService.shared.fetchCityList { cities in
            guard let cities = cities else {return}
            
            viewModel = CityListViewModel(cities: cities)
            viewModel.coordinatorDelegate = self
            
            DispatchQueue.main.async {
                guard let vc = self.cityListVC else {return}
                vc.viewModel = viewModel
                self.navigationController.setViewControllers([vc], animated: false)
            }
        }
    }
    
    lazy var cityListVC: CityListViewController? = {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CityListViewController") as? CityListViewController
        return vc
    }()
}

extension CityCoordinator: CityListViewModelCoordinatorDelegate {
    func selectCity(_ city: City) {
        self.delegate?.didFinishCityListCordinator(coordinator: self, with: city)
    }
}
