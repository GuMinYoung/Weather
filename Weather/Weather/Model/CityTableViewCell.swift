//
//  CityTableViewCell.swift
//  Weather
//
//  Created by 구민영 on 2022/01/27.
//

import UIKit

class CityTableViewCell: UITableViewCell{
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    func update(city: City) {
        icon.image = city.weatherImage
        nameLabel.text = city.name
        tempLabel.text = String(city.temp)
        humidityLabel.text = String(city.humidity)
    }
}
