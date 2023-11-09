//
//  RequestManager.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 25.10.2023.
//

import Foundation
import UIKit

enum ConfigEndpoind {
    // OpenWeatherMap
    static var weatherEndpoint = "https://api.openweathermap.org/data/2.5/weather"
    static var apiKeyWeather = "1e12de2ebdd9cec92bb0252eed0002f5"
   
    // dadata
    static var cityEndpoint = "https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address"
    static var apiKeyCity = "Token d655c6804f4cdb0072cd0f1f26ab7092ea095fda"

}
