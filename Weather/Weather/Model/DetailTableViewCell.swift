//
//  DetailTableViewCell.swift
//  Weather
//
//  Created by 구민영 on 2022/01/31.
//

import UIKit

class DetailTitleCell: UITableViewCell {
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var curWeatherLabel: UILabel!
    @IBOutlet weak var forecastButton: UIButton!
    
    func update() {
        
    }
}

class DetailSubCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    func update() {
        
    }
}
