//
//  RequestManager.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 25.10.2023.
//

import Foundation
import UIKit

enum ConfigEndpoind {
    
    // Здесь все эндпоинты и АПИ ключи к Сервисам, Погода на текущий момент, поиск по городам и яндекс на недельный прогноз
    
    // OpenWeatherMap
    static var weatherEndpoint = "https://api.openweathermap.org/data/2.5/weather"
    static var apiKeyWeather = "1e12de2ebdd9cec92bb0252eed0002f5"
   
    // dadata
    static var cityEndpoint = "https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address"
    static var apiKeyCity = "Token 1bf8aae36e63dda0bb53ec56547a4349927cac1a"
    
    // yandex
    static var forecastEndpoind = "https://api.weather.yandex.ru/v2/forecast"
    static var apiKeyForecast = "aab73ab2-5470-4eee-af97-d7cbb5f66043"
}
