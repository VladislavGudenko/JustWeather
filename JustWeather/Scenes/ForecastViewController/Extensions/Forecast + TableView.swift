//
//  Forecast + TableView.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 10.11.2023.
//

import Foundation
import UIKit

extension ForecastViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: - SetupTableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.getData().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ForecastTableViewCell,
              let data = presenter?.getData() else {
            return UITableViewCell()
        }
        if !data.isEmpty {
            cell.setupCell(data[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
