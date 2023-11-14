//
//  SearchCityPresenterImp.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 07.11.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Cheeezcake Template Inc.
//

import Foundation

class SearchCityPresenterImp: SearchCityPresenter {
    
    private weak var view: SearchCityViewController?
    private let router: SearchCityRouter
    
    var response: [AddressSuggestion] = []
    
    init(_ view: SearchCityViewController,
         _ router: SearchCityRouter) {
        self.view = view
        self.router = router
    }
    
    func searchCity(query: String) {
        RequestManager.request(requestType: .getCity(query: query)) { [weak self] (result: Result<AddressSuggestionsResponse, Error>) in
            DispatchQueue.main.async {
                switch result {
                case let .success(data):
                    print(data)
                    self?.reloadData()
                    data.suggestions.forEach { item in
                        if item.data.geoLat != nil {
                            self?.response.append(item)
                        }
                    }
                    self?.response = data.suggestions
                    self?.view?.reloadTableView()
                case let .failure(error):
                    print(error)
                }
            }
        }
    }
    
    func reloadData() {
        response = []
    }
    
    func getData() -> [AddressSuggestion] {
        response
    }
}
