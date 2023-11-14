//
//  WeatherState.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 20.10.2023.
//

import Foundation
// энамчик для обработки погоды - изначально подразумелась работа с ЮАй при выбранном стейте - также сейчас не используется - можно допилить при желании
enum WeatherState {
    
    case rain
    case clear
    case snow
    case fog
    case cloudy
    case windy
    
}
