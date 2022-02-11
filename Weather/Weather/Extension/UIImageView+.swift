//
//  UIImageView+.swift
//  Weather
//
//  Created by 구민영 on 2022/01/30.
//

import Foundation
import UIKit

extension UIImageView {
    func setImage(urlString: String) {
        //print(#function)
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = self.bounds
        self.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        // 저장된(이미 다운로드한) 이미지가 있으면 사용
        if let cacheImage = CacheManager.shared.object(forKey: urlString as NSString) {
            self.image = cacheImage
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
            return
        }
        
        // 없으면 url로 이미지 다운로드해서 사용
        DispatchQueue.global().async { [weak self] in
            guard let self = self,
                  let url = URL(string: urlString),
                  let data = try? Data(contentsOf: url),
                  let image = UIImage(data: data) else {return}
            
            DispatchQueue.main.async {
                CacheManager.shared.setObject(image, forKey: urlString as NSString)
                self.image = image
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
        }
    }
}
