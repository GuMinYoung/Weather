//
//  DetailWeatherCoordinator.swift
//  Weather
//
//  Created by 구민영 on 2022/01/31.
//

import Foundation
import UIKit

protocol DetailWeatherCoordinatorDelegate: AnyObject {
  func didFinishDetailWeatherCoordinator(coordinator: Coordinator)
  //func forecastClicked()
}

class DetailWeatherCoordinator: BaseCoordinator {
    private let navigationController: UINavigationController
    weak var delegate: DetailWeatherCoordinatorDelegate?
    private let city: City
    
    lazy var detailWeatherVC: DetailWeatherViewController? = {
      let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailWeatherViewController") as? DetailWeatherViewController
      let viewModel = DetailWeatherViewModel(city: self.city)
      vc?.viewModel = viewModel
      vc?.viewModel?.coordinatorDelegate = self
      return vc
    }()
    
    lazy var foreCastVC: ForecastViewController? = {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ForecastViewController") as? ForecastViewController
        vc?.modalPresentationStyle = .pageSheet
        //let viewModel = ForecastViewModel(cityId: city.cityId)
        //vc?.viewModel = viewModel
        //vc?.viewModel?.coordinatorDelegate = self
        return vc
    }()
    
    init(navigationController:UINavigationController, city: City) {
      self.navigationController = navigationController
      self.city = city
    }
    
    override func start() {
//      if let vc = self.detailWeatherVC {
//        self.navigationController.setViewControllers([vc], animated: false)
//      }
        if let vc = self.detailWeatherVC {
          self.navigationController.pushViewController(vc, animated: true)
        }
    }
}

extension DetailWeatherCoordinator: DetailWeatherViewModelCoordinatorlDelegate {
  func forecast() {
//    self.delegate?.didFinishDetailWeatherCoordinator(coordinator: self)
      guard let vc = self.foreCastVC else {return}
      self.navigationController.present(vc, animated: true, completion: nil)
  }
}
