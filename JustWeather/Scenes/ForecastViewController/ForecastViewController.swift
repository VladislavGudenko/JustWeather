//
//  ForecastViewController.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 01.11.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Cheeezcake Template Inc.
//

import UIKit

class ForecastViewController: UIViewController {
    // MARK: - Properties
    var presenter: ForecastPresenterImp?
    var dayTimeState: DayTimeState?
    
    lazy var backGroundImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        view.addSubview(image)
        image.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        return image
    }()
    
    let tableView = UITableView()
    
    lazy var forecastLabel: UILabel = {
        let label = UILabel()
        label.text = Strings.forecast.rawValue
        label.font = UIFont.systemFont(ofSize: 26)
        label.textColor = .white
        return label
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ForecastConfigurator.configure(view: self)
        checkAndSetupCurrentTime()
        setupTableView()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        reloadTableView()
    }
    // MARK: - Methods
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ForecastTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .clear
    }
    
    func reloadTableView() {
        self.tableView.reloadData()
    }
    
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
    }
}
