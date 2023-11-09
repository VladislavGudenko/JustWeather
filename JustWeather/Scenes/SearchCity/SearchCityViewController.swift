//
//  SearchCityViewController.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 07.11.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Cheeezcake Template Inc.
//

import UIKit

class SearchCityViewController: UIViewController {
    
    internal var presenter: SearchCityPresenterImp?
    weak var delegate: SearchCityView?
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundImage = UIImage()
        searchBar.placeholder = "Search city"
        return searchBar
    }()
    
    let tableView = UITableView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchCityConfigurator.configure(view: self)
        view.backgroundColor = .white
        setupTableView()
        addSubviews()
        setupLayout()
        searchBar.delegate = self
    }
    
    deinit {
        print("SearchCityViewController - Deinitialized")
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SearchResultTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func reloadTableView() {
        self.tableView.reloadData()
    }
    
    func closeScene() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.dismiss(animated: true)
        }
    }
    
    func addSubviews() {
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }
    
    func setupLayout() {
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
}

