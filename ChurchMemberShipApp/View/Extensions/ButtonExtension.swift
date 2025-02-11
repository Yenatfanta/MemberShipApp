//
//  ButtonExtension.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/4/25.
//

import Foundation
import UIKit
extension UIButton {
    func applyGradient(_ colors: [UIColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = layer.cornerRadius
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
