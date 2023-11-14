//
//  TemperatureState.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 20.10.2023.
//

import Foundation
// изначально подразумевалось что буду делать метод который будет обрабатывать существующую температуру и на ее основании выставлять нужный стейт и далее будет обрабатываться состояние - можно допилить при желании оставлю пока тут
enum TemperatureState {
    
    case veryCold
    case cold
    case normaly
    case good
    case hot
    case veryHot
    
}
