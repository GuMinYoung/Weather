//
//  CityCoordinator.swift
//  Weather
//
//  Created by 구민영 on 2022/01/31.
//

import Foundation
import UIKit

class CityCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = CityListViewController.instantiate(storyboardName: "Main")
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false) }
    
    func present() {
        let vc = DetailWeatherViewController.instantiate(storyboardName: "Main")
        //vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
