//
//  MainTabBarViewController.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 23.10.2023.
//

import UIKit
import SnapKit

class MainTabBarViewController: UITabBarController {
    // MARK: - Properties
    let mainVC = UINavigationController(rootViewController: MainViewController())
    let forecastVC = ForecastViewController()
    let customVC = CustomViewController()
    /// константа для диаметра кнопки применяется для установки размеров и скругления
    let middleButtonDiameter: CGFloat = 70
    /// цвета - использован colorLiteral так как нет фигмы и либо  просто подбирать наугад либо делать как в ТЗ
    let buttonColor = #colorLiteral(red: 0.4224188924, green: 0.3297615051, blue: 0.8202839494, alpha: 1)
    
    /// кнопка с экшеном
    lazy var customMiddleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.layer.cornerRadius = middleButtonDiameter / 2
        button.backgroundColor = buttonColor
        button.addTarget(self, action: #selector(middleButtonTap), for: .touchUpInside)
        return button
    }()
    /// в ней имэджвью внутри него имедж системный плюсик белого цвета
    lazy var plusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "plus")
        imageView.tintColor = .white
        return imageView
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabBar()
        createTabBarItems()
        addSubviews()
        makeMiddleButtonLayout()
        
    }
    // MARK: - Actions
    @objc func middleButtonTap() {
        selectedIndex = 1
    }
    // MARK: - Methods
    func configureTabBar() {
        let customTabBar = CustomTabBar()
        customTabBar.tintColor = .blue
        customTabBar.backgroundColor = .white
        customTabBar.unselectedItemTintColor = .gray
        self.setValue(customTabBar, forKey: "tabBar")
    }
    
    func createTabBarItems() {
        mainVC.tabBarItem = UITabBarItem(title: Strings.mainTabBar.rawValue, image: UIImage(systemName: "cloud.sun.rain"), selectedImage: nil)
        customVC.tabBarItem.title = ""
        forecastVC.tabBarItem = UITabBarItem(title: "Forecast", image: UIImage(systemName: "calendar"), selectedImage: nil)
        let controllers = [mainVC, customVC, forecastVC]
        self.viewControllers = controllers
        tabBar.backgroundColor = .white
    }
    
    func addSubviews() {
        tabBar.addSubview(customMiddleButton)
        customMiddleButton.addSubview(plusImageView)
    }
    
    func makeMiddleButtonLayout() {
        customMiddleButton.snp.makeConstraints { make in
            make.width.height.equalTo(middleButtonDiameter)
            make.centerX.equalTo(tabBar)
            make.top.equalTo(tabBar.snp.top).inset(-20)
        }
        
        plusImageView.snp.makeConstraints { make in
            make.width.height.equalTo(25)
            make.centerX.centerY.equalTo(customMiddleButton)
        }
    }
}

extension MainTabBarViewController {
    
}
