//
//  MainRouter.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 25.10.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Cheeezcake Template Inc.
//

import UIKit

class MainRouter {
    
    weak var view: UIViewController?
    
    init(_ view: MainViewController) {
        self.view = view
    }
    
    func openSomeScene(delegate: SearchCityView) {
        guard let navController = self.view?.navigationController else {
            return
        }
          SearchCityConfigurator.open(navigationController: navController, delegate: delegate)
    }
}
