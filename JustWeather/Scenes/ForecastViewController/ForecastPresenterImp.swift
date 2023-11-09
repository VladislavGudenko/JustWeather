//
//  ForecastPresenterImp.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 01.11.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Cheeezcake Template Inc.
//

import Foundation

class ForecastPresenterImp: ForecastPresenter {
    
    private weak var view: ForecastViewController?
    private let router: ForecastRouter
    
    init(_ view: ForecastViewController,
         _ router: ForecastRouter) {
        self.view = view
        self.router = router
    }
    
}
