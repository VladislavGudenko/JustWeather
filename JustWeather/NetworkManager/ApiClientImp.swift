//
//  ApiClient.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 08.11.2023.
//

import Foundation

class ApiClientImp {
    
    static let shared = ApiClientImp()
    private init () { }
    
    func execute(requestType: Request, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let request = RequestSettings.setupRequest(type: requestType) else {
            return
        }
        let task =  URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data, let _ = response as? HTTPURLResponse
            else {
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
