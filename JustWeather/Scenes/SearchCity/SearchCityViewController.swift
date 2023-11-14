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
    // MARK: - Properties
    internal var presenter: SearchCityPresenterImp?
    weak var delegate: SearchCityView?
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundImage = UIImage()
        searchBar.placeholder = "Search city"
        return searchBar
    }()
    
    let tableView = UITableView()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchCityConfigurator.configure(view: self)
        
        setupTableView()
        setupUI()
        searchBar.delegate = self
    }
    // MARK: - Methods
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
}

