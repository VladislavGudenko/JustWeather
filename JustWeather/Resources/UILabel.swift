//
//  UILabel.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 08.11.2023.
//

import Foundation

import UIKit
// расширение для лейблов для удобства настройки
extension UILabel {
    
    @discardableResult
    func font(_ font: UIFont) -> Self {
        self.font = font
        return self
    }
    
    @discardableResult
    func setManyLines() -> Self {
        self.numberOfLines = 0
        return self
    }
    
    @discardableResult
    func color(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }
    
    @discardableResult
    func alignment(_ newTextalignment: NSTextAlignment) -> Self {
        self.textAlignment = newTextalignment
        return self
    }
    
}
