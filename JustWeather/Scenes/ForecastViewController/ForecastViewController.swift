//
//  ForecastViewController.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 01.11.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Cheeezcake Template Inc.
//

import UIKit

class ForecastViewController: UIViewController {
    
    var presenter: ForecastPresenterImp?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ForecastConfigurator.configure(view: self)
        view.backgroundColor = .green
    }
    

}

extension ForecastViewController: ForecastView {
    
}
