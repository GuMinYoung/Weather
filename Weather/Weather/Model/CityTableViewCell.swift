//
//  CityTableViewCell.swift
//  Weather
//
//  Created by 구민영 on 2022/01/27.
//

import UIKit

class CityTableViewCell: UITableViewCell{
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    func update(_ city: City) {
        iconImageView.setImage(urlString: city.weatherImageUrl ?? "")
        nameLabel.text = city.name
        tempLabel.text = "현재기온 " + String(city.temp ?? 0) + "도"
        humidityLabel.text = "현재습도 " + String(city.humidity ?? 0) + "%"
    }
}
