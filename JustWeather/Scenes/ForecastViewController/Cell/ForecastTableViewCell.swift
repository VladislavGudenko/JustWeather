//
//  ForecastTableViewCell.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 10.11.2023.
//

import Foundation
import UIKit

class ForecastTableViewCell: UITableViewCell {
    
    private let labelDate = UILabel()
        .setManyLines()
        .color(.white)
        .font(UIFont.systemFont(ofSize: 16))
    
    private let labelCondition = UILabel()
        .setManyLines()
        .color(.white)
        .font(UIFont.systemFont(ofSize: 16))
    
    private let labelMin = UILabel()
        .setManyLines()
        .color(.white)
        .font(UIFont.systemFont(ofSize: 16))
    
    private let labelMax = UILabel()
        .setManyLines()
        .color(.white)
        .font(UIFont.systemFont(ofSize: 16))
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        configureCell()
        setupLabels()
        setupLayout()
    }
    
    private func configureCell() {
        selectionStyle = .none
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 3
    }
    
    private func setupLabels() {
        let labels = [labelDate, labelCondition, labelMin, labelMax]
        labels.forEach { allLabels in
            contentView.addSubview(allLabels)
            backgroundColor = UIColor.clear
        }
    }
    
    private func setupLayout() {
        labelDate.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(20)
            make.leading.equalTo(contentView).inset(10)
            make.bottom.equalTo(contentView).inset(20)
        }
        labelCondition.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(20)
            make.leading.equalTo(labelDate.snp.trailing).offset(10)
            make.bottom.equalTo(contentView).inset(20)
        }
        labelMin.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(20)
            make.leading.equalTo(labelCondition.snp.trailing).offset(10)
            make.bottom.equalTo(contentView).inset(20)
        }
        labelMax.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(20)
            make.leading.equalTo(labelMin.snp.trailing).offset(10)
            make.bottom.equalTo(contentView).inset(20)
        }
    }
    
    func setupCell(_ data: Forecasts) {
        labelDate.text = data.date
        labelMin.text = "от \(data.parts.day.tempMin)°"
        labelMax.text = "до \(data.parts.day.tempMax)°"
        updateLabelDate(dateString: labelDate.text ?? "")
        labelCondition.text = TranslatorService.translateFromEngToRu(data.parts.day.condition)
    }
    
    func updateLabelDate(dateString: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "dd.MM.YYYY"
            let formattedDateString = dateFormatter.string(from: date)
            labelDate.text = formattedDateString
        } else {
            return
        }
    }
}
