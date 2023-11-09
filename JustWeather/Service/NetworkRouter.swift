//
//  NetworkRouter.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 07.11.2023.
//

import Foundation

public typealias NetworkRouterCompletion = ( _ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()

protocol NetworkRouter: class {
    associatedtype EndPoint: EndpointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
