//
//  EndpointType.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 07.11.2023.
//

import Foundation

protocol EndpointType {
    var baseUrl: URL { get }
    var path: String { get }
    var httpMethod: HttpMethod { get }
    var task: HttpTask { get }
    var headers: HttpHeaders? { get }
}
