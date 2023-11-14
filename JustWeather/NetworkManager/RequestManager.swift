//
//  Requests.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 25.10.2023.
//

import Foundation

struct RequestManager {
    // Базовый запрос принимает в себя запрос, имеет комплишен с результатом(структурой) и эррором - далее внутри тела два кейса с саксессом и эррором где обрабатываем данные либо ошибку
    static func request<T: Decodable>(requestType: Request, completion: @escaping (Result<T, Error>) -> Void) {
        
        DispatchQueue.global().async {
            ApiClientImp.shared.execute(requestType: requestType) { (result: Result<Data, Error>) in
                switch result {
                case let .success(str):
                    do {
                        let decoder = JSONDecoder()
                        let suggestionsResponse = try decoder.decode(T.self, from: str)
                        completion(.success(suggestionsResponse))
                    } catch {
#if DEBUG
                        print("ошибка JSON: \(error)")
#endif
                        completion(.failure(error))
                    }
                case let .failure(error):
                    completion(.failure(error))
                }
            }
        }
    }
}
