//
//  ForecastConfigurator.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 01.11.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Cheeezcake Template Inc.
//

import UIKit

enum ForecastConfigurator {
    
    static func configure(view: ForecastViewController) {
        let router = ForecastRouter(view)
        let presenter = ForecastPresenterImp(view, router)
        view.presenter = presenter
    }

    static func open(navigationController: UINavigationController) {
        let view = ForecastViewController()
        configure(view: view)
        navigationController.pushViewController(view, animated: true)
    }
}
