//
//  Alerts.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/7/25.
//

import Foundation
import UIKit
struct Alerts {
    static func getAlert(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        return alert
    }
}
