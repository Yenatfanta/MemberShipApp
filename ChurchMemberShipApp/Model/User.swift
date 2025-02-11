//
//  Member.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/4/25.
//

import Foundation
struct User: Codable, Identifiable {
    let id: String
    let name: String
    let phoneNumber: String?
    let email: String?
    let membershipStatus: String
    let groupIds: [String]
    let address: String?
    let role: UserRole
}
enum UserRole: String, Codable {
    case member
    case admin
}
