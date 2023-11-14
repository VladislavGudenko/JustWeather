//
//  WeekWeatherEntity.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 10.11.2023.
//

import Foundation
// Для Яндекса на 7 дней, АПИ ключ живет 30 дней
struct WeekWeather: Codable {
    var forecasts: [Forecasts]
}

struct Forecasts: Codable {
    var date: String // дата с сегодняшней и на 7 дней
    var parts: Parts
}

struct Parts: Codable {
    var day: Day
}

struct Day: Codable {
    var tempMin: Int // минимальная температура
    var tempMax: Int // максимальная температура
    var condition: String // описание погодных условий типа дождь, снег, ясно и т д - добавлен переводчик всех состояний
    
    enum CodingKeys: String, CodingKey {
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case condition
    }
}
