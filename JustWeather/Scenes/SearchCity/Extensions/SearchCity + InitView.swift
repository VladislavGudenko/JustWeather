//
//  SearchCity + InitView.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 08.11.2023.
//

import Foundation

extension SearchCityViewController {
    // MARK: - SetupAllUI
    func setupUI() {
        addSubviews()
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(46)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(10)
            make.leading.trailing.equalTo(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func addSubviews() {
        view.backgroundColor = .white
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }
}
