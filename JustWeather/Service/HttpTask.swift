//
//  HttpTask.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 07.11.2023.
//

import Foundation

public typealias HttpHeaders = [String: String]

public enum HttpTask {
    
    case request
    
    case requestParameters(bodyParameters: Parameters?,
                           urlParameters: Parameters?)
    
    case requestParametersAndHeaders(bodyParameters: Parameters?,
                                     urlParameters: Parameters?,
                                     additionHeaders: HttpHeaders?)
    
}
