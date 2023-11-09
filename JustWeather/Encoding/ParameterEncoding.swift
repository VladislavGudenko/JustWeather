//
//  ParameterEncoding.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 07.11.2023.
//

import Foundation

public typealias Parameters = [String: Any]

public protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

public enum NetworkError: String, Error {
    case parametersNil = "Parameters were nil"
    case encodingFailed = "Parameters encoding failed"
    case missingUrl = "Url is nil"
}
