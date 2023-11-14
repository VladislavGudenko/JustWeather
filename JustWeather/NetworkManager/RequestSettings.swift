//
//  Request.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 08.11.2023.
//

import Foundation

enum Request {
    // сюда добавляем все запросы которые могли бы быть и входные параметры которые мы отдаем на запросе
    case getCity(query: String)
    case getWeather(lat: String, lon: String)
    case getForecast(lat: String, lon: String)
}
    // внутри данной структуры мы формируем запрос полностью - добавляем эндпоинт, квери параметры, хэдэры, апи-ключи и т д и возвращаем готовый URLRequest
struct RequestSettings {
    
    static func setupRequest(type: Request) -> URLRequest? {
        
        var request: URLRequest
        
        switch type {
        case let .getCity(query: query):
            if let url = URL(string: ConfigEndpoind.cityEndpoint) {
                request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.setValue("application/json", forHTTPHeaderField: "Accept")
                request.setValue(ConfigEndpoind.apiKeyCity,
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
            let baseURLString = ConfigEndpoind.weatherEndpoint
            var urlComponents = URLComponents(string: baseURLString)
            let parameters = [
                "lat": lat,
                "lon": lon,
                "appid": ConfigEndpoind.apiKeyWeather,
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
            
        case let .getForecast(lat: lat, lon: lon):
            let baseURL = ConfigEndpoind.forecastEndpoind
            var urlComponents = URLComponents(string: baseURL)
            let parameters = [
                "lat": lat,
                "lon": lon,
                "lang": "ru_RU",
                "limit": "7"
            ]
            urlComponents?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value)}
            guard let url = urlComponents?.url else {
#if DEBUG
                print("ошибка setupRequest getWeather")
#endif
                return nil
            }
            request = URLRequest(url: url)
            request.setValue(ConfigEndpoind.apiKeyForecast, forHTTPHeaderField: "X-Yandex-API-Key")
            request.httpMethod = "GET"
            return request
        }
    }
}
