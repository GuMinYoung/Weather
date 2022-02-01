//
//  DetailTableViewCell.swift
//  Weather
//
//  Created by 구민영 on 2022/01/31.
//

import UIKit

class DetailView: UIView {
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var curWeatherLabel: UILabel!
    @IBOutlet weak var forecastButton: UIButton!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    
    func update(_ city: City) {
        cityNameLabel.text = city.name
    }
}
