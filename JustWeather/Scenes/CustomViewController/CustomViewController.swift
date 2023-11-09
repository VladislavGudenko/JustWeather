//
//  CustomViewController.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 01.11.2023.
//

import UIKit

class CustomViewController: UIViewController {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "This text for test VC"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .white
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemRed
        setupLabel()
    }
    
    func setupLabel() {
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
