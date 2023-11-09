//
//  MainView.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 23.10.2023.
//

import Foundation

protocol MainView: AnyObject {
    
    func setupCoordinates(latitude: Double, longitude: Double)
    
}
