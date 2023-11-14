//
//  DataSingletone.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 13.11.2023.
//

import Foundation

class DataSingletone {
    
    static let shared = DataSingletone()
    var data: [Forecasts]?
    
    private init() { }
    
    func updateData(newData: [Forecasts]) {
        data = newData
    }
}
