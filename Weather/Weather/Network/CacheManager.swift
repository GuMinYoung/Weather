//
//  CacheManager.swift
//  Weather
//
//  Created by 구민영 on 2022/01/30.
//

import Foundation
import UIKit

class CacheManager {
    static let shared = NSCache<NSString, UIImage>()
    // 클래스가 메모리에서 해제 및 초기화될 때 캐시도 초기화되므로 이를 방지
    private init() {}
}
