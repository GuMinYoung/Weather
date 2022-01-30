//
//  String+.swift
//  Weather
//
//  Created by  구민영 on 2022/01/30.
//

import Foundation
import UIKit

extension String {
    func urlToData() -> Data {
        var data: Data?
        DispatchQueue.global().async {
            guard let url = URL(string: self) else {return}
            data = try? Data(contentsOf: url)
        }
        guard let data = data else {return Data()}
        return data
    }
}
