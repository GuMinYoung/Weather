//
//  Coordinator.swift
//  Weather
//
//  Created by 구민영 on 2022/01/31.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}
