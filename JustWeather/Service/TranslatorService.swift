//
//  TranslatorService.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 14.11.2023.
//

import Foundation

enum TranslatorService {
    
    static func translateFromEngToRu(_ engWord: String) -> String? {
        let engWords = [
            "clear":"ясно",
            "partly-cloudy":"малооблачно",
            "cloudy": "облачно с прояснениями",
            "overcast":"пасмурно",
            "light-rain":"небольшой дождь",
            "rain":"дождь",
            "heavy-rain":"сильный дождь",
            "showers":"ливень",
            "wet-snow":"дождь со снегом",
            "light-snow":"небольшой снег",
            "snow":"снег",
            "snow-showers":"снегопад",
            "hail":"град",
            "thunderstorm":"гроза",
            "thunderstorm-with-rain":"дождь с грозой",
            "thunderstorm-with-hail":"гроза с градом"
        ]
        return engWords[engWord]
    }
    
}
