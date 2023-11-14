//
//  Forecast + InitView.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 10.11.2023.
//

import Foundation
import UIKit

extension ForecastViewController {
    
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
    
    func setupUI() {
        setupBackground()
        view.addSubview(backGroundImage)
        view.addSubview(forecastLabel)
        view.addSubview(tableView)
        setupLayout()
    }
    
    func setupLayout() {
        forecastLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.leading.equalToSuperview().inset(20)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(forecastLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
