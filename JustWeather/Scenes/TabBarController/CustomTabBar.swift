//
//  CustomTabBar.swift
//  JustWeather
//
//  Created by Владислав Гуденко on 01.11.2023.
//

import Foundation
import UIKit

class CustomTabBar: UITabBar {
    /// метод позволяет осуществлять нажатие на центральную кнопку вне границ таббара за счет иерархии сабвью
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let pointIsInside = super.point(inside: point, with: event)
        if pointIsInside == false {
            for subview in subviews {
                let pointInSubview = subview.convert(point, from: self)
                if subview.point(inside: pointInSubview, with: event) {
                    return true
                }
            }
        }
        return pointIsInside
    }
}
