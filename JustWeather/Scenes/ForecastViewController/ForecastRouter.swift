//
//  ForecastRouter.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 01.11.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Cheeezcake Template Inc.
//

import UIKit

class ForecastRouter {
    
    weak var view: UIViewController?
    
    init(_ view: ForecastViewController) {
        self.view = view
    }
    // Не используется -> роутер как база для MVP если бы был переход на другие экраны
    func openSomeScene() {
        guard let navController = self.view?.navigationController else {
            return
        }
        //  SomeSceneConfigurator.open(navigationController: navController)
    }
}
