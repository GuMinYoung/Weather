//
//  DetailWeatherViewController.swift
//  Weather
//
//  Created by 구민영 on 2022/01/31.
//

import UIKit

class DetailWeatherViewController: UIViewController {
    var viewModel: DetailWeatherViewModel?

    @IBOutlet var detailView: DetailView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let viewModel = viewModel else {return}
        
        self.navigationItem.title = "날씨 정보"
        detailView?.update(viewModel.cityInfo)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpForecastButton(_ sender: UIButton) {
        viewModel?.forecastClicked()
    }
    
    func setNavigationTitle(_ text: String) {
        self.navigationItem.title = text
    }
}
