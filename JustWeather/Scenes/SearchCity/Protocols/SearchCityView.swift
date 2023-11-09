//
//  SearchCityView.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 07.11.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Cheeezcake Template Inc.
//

import UIKit

protocol SearchCityView: AnyObject {
    
    func coordinatesSender(lat: String, lon: String)
    
}
