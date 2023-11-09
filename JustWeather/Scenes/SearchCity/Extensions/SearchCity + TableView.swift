//
//  SearchCity + TableView].swift
//  JustWeather
//
//  Created by Владислав Гуденко on 08.11.2023.
//

import Foundation
import UIKit

extension SearchCityViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.response.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SearchResultTableViewCell,
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let data = presenter?.getData() else { return }
        guard let lat = data[indexPath.row].data.geoLat,
              let lon = data[indexPath.row].data.geoLon else { return }
        delegate?.coordinatesSender(lat: lat, lon: lon)
        print(">>>\(lat)<<<<<\(lon)")
        closeScene()
    }
}
