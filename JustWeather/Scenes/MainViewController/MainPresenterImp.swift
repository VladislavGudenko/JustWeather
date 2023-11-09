//
//  MainPresenterImp.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 25.10.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Cheeezcake Template Inc.
//

import Foundation

class MainPresenterImp: MainPresenter {
    
    private weak var view: MainViewController?
    private let router: MainRouter
    
    let kelvin = 273
    var latitude: Double?
    var longitude: Double?
    
    init(_ view: MainViewController,
         _ router: MainRouter) {
        self.view = view
        self.router = router
    }
    
    func getWeatherData() {
        self.view?.startLoader()
        RequestManager.request(requestType: .getWeather(lat: "\(latitude ?? 0.0)", lon: "\(longitude ?? 0.0)" )) { [weak self]
            (result: Result<WeatherResponse, Error>) in
            DispatchQueue.main.async {
                switch result {
                case let .success(data):
                    self?.view?.stopLoader()
                    print(data)
                    guard let currentTemp = data.main?.temp?.rounded() else {return}
                    guard let currentCity = data.name else { return }
                    self?.view?.setupTempLabel(Int(currentTemp))
                    self?.view?.setupCityLabel(currentCity)
                    
                case let .failure(error):
                    print(error)
                }
            }
        }
    }
    
    func openSearchCityVC() {
        router.openSomeScene()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //    func getWeatherForTechLead(parametr: Int) {
    /// специально для Романа вывести есть ли в ответе параметр, и, если он есть - записать в labelOne, а если нет - грустный смайлик. Пример грустного смайлика ;(
    //        let baseUrl = ConfigEndpoind.apiEndpoint
    //        let parameters = ["lat": "\(self.view?.latitudeForUrl ?? 0.0)", "lon": "\(self.view?.longitudeForUrl ?? 0.0)", "appid": "\(ConfigEndpoind.apiKey)"]
    //        requests.getCurrentWeather(baseUrl: baseUrl, parameters: parameters) { weather in
    //            self.weather = weather
    //            self.weather.weather.append(Weather(id: 900, main: "", description: "", icon: ""))
    //            self.weather.append(Weather(id: 199, main: "", description: "", icon: ""))
    //            self.weather.append(Weather(id: 256, main: "", description: "", icon: ""))
    
    //            print("*************\(weather)")
    //            print("-------------\(self.weather)")
    
    /// решение задачки Романа
    
    //            DispatchQueue.main.async {
    //                if let foundId = self.weather.first(where: {
    //                    $0.id == parametr
    //                }) {
    //                    self.view?.labelOne.text = "\(parametr)"
    //                } else {
    //                    self.view?.labelOne.text = ":("
    //                }
    //            }
    //        }
    //    }
    
    //    func getСountWeatherForTechLead(id: Int) -> Int {
    /// специально для Романа вывести в ответе количество ID заданным CountOf, и, это количество записать в labelOne,
    //        let baseUrl = ConfigEndpoind.apiEndpoint
    //        let parameters = ["lat": "\(self.view?.latitudeForUrl ?? 0.0)", "lon": "\(self.view?.longitudeForUrl ?? 0.0)", "appid": "\(ConfigEndpoind.apiKey)"]
    //        requests.getCurrentWeather(baseUrl: baseUrl, parameters: parameters) { weather in
    //            self.weather = weather
    //            self.weather.append(Weather(id: 900, main: "", description: "", icon: ""))
    //            self.weather.append(Weather(id: 900, main: "", description: "", icon: ""))
    //            self.weather.append(Weather(id: 900, main: "", description: "", icon: ""))
    //            self.weather.append(Weather(id: 899, main: "", description: "", icon: ""))
    //
    //            print("*************\(weather)")
    //            print("-------------\(self.weather)")
    //
    /// решение задачки Романа
    
    //            let count = self.weather.filter { $0.id == id }.count
    //            self.view?.labelOne.text = "\(count)"
    //
    //            return count
    //        }
    //    }
    //}
    //            if self.weather.first?.id != parametr {
    //                self.view?.labelOne.text = ":("
    //            } else {
    //                self.view?.labelOne.text = "\(parametr)"
    //            }
    
    //            DispatchQueue.main.async {
    //                print(self.weather)
    //                self.view?.labelOne.text = "\(self.weather.first?.id ?? 0)"
    //            }
}
