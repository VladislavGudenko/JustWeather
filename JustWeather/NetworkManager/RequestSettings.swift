//
//  Request.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 08.11.2023.
//

import Foundation

enum Request {
    
    case getCity(query: String)
    case getWeather(lat: String, lon: String)
}

struct RequestSettings {
    
    static func setupRequest(type: Request) -> URLRequest? {
        
        var request: URLRequest
        
        switch type {
        case let .getCity(query: query):
            if let url = URL(string: "https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address") {
                request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.setValue("application/json", forHTTPHeaderField: "Accept")
                request.setValue("Token 1bf8aae36e63dda0bb53ec56547a4349927cac1a",
                                 forHTTPHeaderField: "Authorization")
                let parameters = [
                    "query": query,
                    "count": 5,
                    "from_bound": [ "value": "city" ],
                    "to_bound": [ "value": "city" ]
                ] as [String : Any]
                guard let jsonData = try? JSONSerialization.data(withJSONObject: parameters) else {
#if DEBUG
                    print("ошибка setupRequest getGeo")
#endif
                    return nil
                }
                request.httpBody = jsonData
                return request
            } else {
                return nil
            }
            
        case let .getWeather(lat: lat, lon: lon):
            let baseURLString = "https://api.openweathermap.org/data/2.5/weather"
            var urlComponents = URLComponents(string: baseURLString)
            let parameters = [
                "lat": lat,
                "lon": lon,
                "appid": "1e12de2ebdd9cec92bb0252eed0002f5",
                "lang": "ru"
            ]
            urlComponents?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
            guard let url = urlComponents?.url else {
#if DEBUG
                print("ошибка setupRequest getWeather")
#endif
                return nil
            }
            request = URLRequest(url: url)
            request.httpMethod = "GET"
            return request
            
        }
    }
}
