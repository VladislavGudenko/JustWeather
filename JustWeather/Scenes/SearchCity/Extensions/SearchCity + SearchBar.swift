//
//  SearchCity + SearchBar.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 08.11.2023.
//

import Foundation
import UIKit

extension SearchCityViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            self.presenter?.searchCity(query: searchText)
        })
    }
}
