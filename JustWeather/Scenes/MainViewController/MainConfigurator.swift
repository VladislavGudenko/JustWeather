//
//  MainConfigurator.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 25.10.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Cheeezcake Template Inc.
//

import UIKit

enum MainConfigurator {
    
    static func configure(view: MainViewController) {
        let router = MainRouter(view)
        let presenter = MainPresenterImp(view,
                                         router)
        view.presenter = presenter
    }

    static func open(navigationController: UINavigationController) {
        let view = MainViewController()
        Self.configure(view: view)
        navigationController.pushViewController(view, animated: true)
    }
}
