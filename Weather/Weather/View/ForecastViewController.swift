//
//  ForecastViewController.swift
//  Weather
//
//  Created by 구민영 on 2022/02/02.
//

import UIKit

class ForecastViewController: UIViewController {
    var viewModel: ForecastViewModel?
    @IBOutlet weak var humidityView: GraphView!
    @IBOutlet weak var tempMinView: GraphView!
    @IBOutlet weak var tempMaxView: GraphView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let viewModel = viewModel else {
            return
        }
        
        let humidityList = viewModel.forecastList.map { Double($0.humidity) }
        let tempMinList = viewModel.forecastList.map { $0.tempMin }
        let tempMaxList = viewModel.forecastList.map { $0.tempMax }
        
        humidityView.graphPoints = (GraphKey.humidity, humidityList)
        tempMinView.graphPoints = (GraphKey.tempMin, tempMinList)
        tempMaxView.graphPoints = (GraphKey.tempMax, tempMaxList)
    
        print(viewModel.forecastList)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
