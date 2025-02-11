//
//  Payment.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/4/25.
//

import Foundation
struct Payment: Codable, Identifiable {
    let id: String
    let userId: String
    let amount: Double
    let method: String
    let date: String
    let status: Status
    let transactionId: String
}
enum Status: String, Codable {
    case pending
    case completed
    case failed
}
