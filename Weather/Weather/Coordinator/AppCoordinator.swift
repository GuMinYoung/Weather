//
//  AppCoordinator.swift
//  Weather
//
//  Created by 구민영 on 2022/02/01.
//

import Foundation
import UIKit

class BaseCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    func start() {}
}

class AppCoordinator: BaseCoordinator {
    // MARK: - Properties
    let window: UIWindow?
    
    lazy var rootViewController: UINavigationController = {
        return UINavigationController()
    }()
    
    //  the AppCoordinator it must own the window.
    init(window: UIWindow?) {
        self.window = window
    }
    
    override func start() {
        guard let window = window else { return }
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        
        self.cityListFlow()
    }
    
    private func cityListFlow() {
        let cityListCoordinator = CityCoordinator(navigationController: self.rootViewController)
        cityListCoordinator.delegate = self
        store(coordinator: cityListCoordinator)
        cityListCoordinator.start()
    }
    
    private func detailWeatherFlow(city info: City) {
        let detailWeatherCoordinator = DetailWeatherCoordinator(navigationController: self.rootViewController, city: info)
        detailWeatherCoordinator.delegate = self
        store(coordinator: detailWeatherCoordinator)
        detailWeatherCoordinator.start()
    }
}

extension AppCoordinator: CityListCoordinatorDelegate {
    func didFinishCityListCordinator(coordinator: Coordinator, city info: City) {
        //self.free(coordinator: coordinator)
        self.detailWeatherFlow(city: info)
    }
}

extension AppCoordinator: DetailWeatherCoordinatorDelegate {
    func didFinishDetailWeatherCoordinator(coordinator: Coordinator) {
        self.free(coordinator: coordinator)
        self.cityListFlow()
    }
}
