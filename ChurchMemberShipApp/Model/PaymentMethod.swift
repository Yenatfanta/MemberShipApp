//
//  PaymentMethod.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/9/25.
//

import Foundation
struct PaymentMethod: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let type: PaymentType
}
enum PaymentType {
    case applePay, payPal, card
}
