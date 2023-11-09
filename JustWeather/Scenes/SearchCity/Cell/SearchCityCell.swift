//
//  SearchCityCell.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 08.11.2023.
//

import Foundation
import UIKit

class SearchResultTableViewCell: UITableViewCell {
    
    private var label = UILabel()
        .setManyLines()
        .color(.black)
        .font(UIFont.systemFont(ofSize: 18))
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        configureCell()
        setupLabel()
    }
    
    // MARK: - Configure UI
    private func configureCell() {
        selectionStyle = .none
        backgroundColor = UIColor.white
    }
    
    private func setupLabel() {
        contentView.addSubview(label)
        label.backgroundColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    // MARK: - Setup cell
    func setupCell(_ data: AddressSuggestion) {
        label.text = data.value
    }
}
