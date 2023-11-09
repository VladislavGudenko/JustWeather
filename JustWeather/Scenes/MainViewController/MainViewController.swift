//
//  ViewController.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 20.10.2023.
//

import UIKit
import SnapKit
import CoreLocation

class MainViewController: UIViewController {
    
    var presenter: MainPresenterImp?
    
    let locationManager = LocationManager()
    let searchVC = SearchCityViewController()
    
    var dayTimeState: DayTimeState?
    var hour = 0
    var city: String?
    var kelvin = 273
    
    var latitudeForUrl: Double = 0.0
    var longitudeForUrl: Double = 0.0
    
    lazy var backGroundImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.alpha = 0.7
        view.addSubview(image)
        image.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        return image
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .white
        activityIndicator.style = .large
        view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        return activityIndicator
    }()
    
    lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.text = "-"
        label.font = UIFont.systemFont(ofSize: 70)
        label.textColor = .white
        return label
    }()
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "-"
        label.font = UIFont.systemFont(ofSize: 35)
        label.textColor = .white
        return label
    }()
    
    lazy var labelDescription: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var labelThree: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    
    // функции проверок текущего времени в тч запросы на VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        MainConfigurator.configure(view: self)
        locationManager.delegate = self
        locationManager.activateLocation()
        setupNavBarButton()
        checkAndSetupCurrentTime()
        setupBackground()
        addSubview()
        setupLayout()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            self.presenter?.getWeatherData()
        }
    }
    
    deinit {
        print("MainViewController - Deinitialized")
    }
    
    @objc
    func searchCityTapped() {
        searchVC.delegate = self
        presenter?.openSearchCityVC()
    }
    
    func startLoader() {
        activityIndicator.startAnimating()
    }
    
    func stopLoader() {
        activityIndicator.stopAnimating()
    }
    
    func setupNavBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: Strings.choiseCity.rawValue, style: .plain, target: self, action: #selector(searchCityTapped))
        navigationItem.rightBarButtonItem?.tintColor = .white
    }

    // проверка текущего времени и установка стейта в зависимости от текущего времени
    func checkAndSetupCurrentTime() {
        let date = Date()
        let calendar = Calendar.current
        let currentHour = calendar.component(.hour, from: date)

        if (currentHour >= 6) && (currentHour < 10) {
            dayTimeState = .morning
        } else if (currentHour >= 10) && (currentHour < 16) {
            dayTimeState = .afternoon
        } else if (currentHour >= 16) && (currentHour < 23) {
            dayTimeState = .evening
        } else if (currentHour >= 23) || (currentHour < 6) {
            dayTimeState = .night
        }
        hour = currentHour
    }
    
    // вместо цвета фона устанавливать картинку в зависимости от времени суток
    func setupBackground() {
        switch dayTimeState {
        case .morning:
            backGroundImage.image = UIImage(named: "morning")
            return
        case .afternoon:
            backGroundImage.image = UIImage(named: "afternoon")
            return
        case .evening:
            backGroundImage.image = UIImage(named: "evening")
            return
        case .night:
            backGroundImage.image = UIImage(named: "night")
            return
        case .none:
            break
        }
    }
    
    func setupTempLabel(_ temp: Int) {
        let correctTemp = temp - kelvin
        self.tempLabel.text = "\(correctTemp)°"
        if correctTemp > 30 {
            setupDescriptionLabel(Strings.moreThanThirty.rawValue)
        } else if correctTemp > 20 && correctTemp < 30 {
            setupDescriptionLabel(Strings.moreThanTwenty.rawValue)
        } else if correctTemp > 10 && correctTemp < 20 {
            setupDescriptionLabel(Strings.moreThenTen.rawValue)
        } else if correctTemp > 0 && correctTemp < 10 {
            setupDescriptionLabel(Strings.moreThenZero.rawValue)
        } else {
            setupDescriptionLabel(Strings.lessThenZero.rawValue)
        }
    }
    
    func setupCityLabel(_ city: String) {
        self.cityLabel.text = city
    }
    
    func setupDescriptionLabel(_ text: String) {
        self.labelDescription.text = text
        
    }
}

extension MainViewController {

    func addSubview() {
        view.addSubview(backGroundImage)
        view.addSubview(tempLabel)
        view.addSubview(cityLabel)
        view.addSubview(labelDescription)
    }
    
    func setupLayout() {

        tempLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        cityLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(tempLabel.snp.bottom).offset(20)
        }
        labelDescription.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(cityLabel.snp.bottom).offset(120)
        }
    }
}

extension MainViewController: MainView {
    
    func setupCoordinates(latitude: Double, longitude: Double) {
        presenter?.latitude = latitude
        presenter?.longitude = longitude
        print("@@@@@@\(presenter?.latitude)")
        print("@@@@@@\(presenter?.longitude)")
    }
}

extension MainViewController: SearchCityView {
    
    func coordinatesSender(lat: String, lon: String) {
        presenter?.latitude = Double(lat)
        presenter?.longitude = Double(lon)
        print(presenter?.latitude)
        print(presenter?.longitude)
    }
    
}
