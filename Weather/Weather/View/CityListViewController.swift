//
//  CityListViewController.swift
//  Weather
//
//  Created by 구민영 on 2022/01/27.
//

import UIKit

class CityListViewController: UIViewController {
    @IBOutlet weak var cityTableView: UITableView!
    var viewModel: CityListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "도시 목록"
        cityTableView.delegate = self
        cityTableView.dataSource = self
    }
}

extension CityListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.selectRow(row: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension CityListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.numberOfRowsInSection(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as? CityTableViewCell else {
            return UITableViewCell()
        }
        
        cell.update(viewModel?.city(at: indexPath.row) ?? City())
        return cell
    }
}
