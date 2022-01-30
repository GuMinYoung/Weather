//
//  UIImageView+.swift
//  Weather
//
//  Created by 구민영 on 2022/01/30.
//

import Foundation
import UIKit

extension UIImageView {
    func load(image: UIImage?) {
        guard let image = image else {return}
            DispatchQueue.main.async {
                self.image = image
            }
        }
}

