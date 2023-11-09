//
//  WeatherEntity.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 25.10.2023.
//

import Foundation

struct WeatherResponse: Decodable {
    var coord: Coord?
    var weather: [WeatherInfo]?
    var base: String?
    var main: MainInfo?
    var visibility: Int?
    var wind: WindInfo?
//    var clouds: CloudsInfo
//    var sys: SysInfo
//    var timezone: Int
//    var id: Int
    var name: String?
//    var cod: Int
}

struct Coord: Decodable {
    var lon: Double?
    var lat: Double?
}

struct WeatherInfo: Decodable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}

struct MainInfo: Decodable {
    var temp: Double?
    var feels_like: Double?
    var temp_min: Double?
    var temp_max: Double?
}

struct WindInfo: Decodable {
    var speed: Double?
    var deg: Int?
    var gust: Double?
}

struct CloudsInfo: Decodable {
    var all: Int?
}

struct SysInfo: Decodable {
    var type: Int?
    var id: Int?
    var country: String?
    var sunrise: Int?
    var sunset: Int?
}
