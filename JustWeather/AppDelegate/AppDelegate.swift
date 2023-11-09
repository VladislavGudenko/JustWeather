//
//  AppDelegate.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 20.10.2023.
//

import UIKit
import CoreLocation

@main
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

//    var locationManagerr = CLLocationManager()
//    var geocoder = CLGeocoder()
    /// на старте начинаем процесс по поиску геопозиции, тут же и дергаем координаты и город
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//
//        locationManagerr.delegate = self
//        locationManagerr.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        /// запрашиваем геопозицию (при использовании)
//        locationManagerr.requestWhenInUseAuthorization()
        /// начинаем апдейтить геопозицию
//        locationManagerr.startUpdatingLocation()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}
/// экстеншн для методов делегата, тут обрабатываем геопозицию или принтим в консоль эррор в обратном случае
//extension AppDelegate {
    /// здесь достаем наименование города
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let locationCity = locations.last {
//            geocoder.reverseGeocodeLocation(locationCity) { (placemarks, error) in
//                if let placemark = placemarks?.first {
//                    if let city = placemark.locality {
//                        print("City is \(city)")
//                    }
//                }
//            }
//        }
        /// здесь достаем точные координаты (можем дергать не точные а приблизительные в методе locationManagerr.desiredAccuracy = kCLLocationAccuracyNearestTenMeters - использовать другие параметры для оптимизации расхода батареи)
//        if let location = locations.first {
//            let latitude = location.coordinate.latitude
//            let longitude = location.coordinate.longitude
//            print(latitude)
//            print(longitude)
//        }
//    }
    /// просто принтим эррор пока на этапе дэва - можем модалку показывать или все что угодно
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print("Error to request location")
//    }

