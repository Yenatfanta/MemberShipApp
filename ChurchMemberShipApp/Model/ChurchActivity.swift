//
//  ChurchActivity.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/4/25.
//

import Foundation
struct ChurchActivity: Codable, Identifiable {
    let id: String
    let name: String
    let description: String?
    let imageUrls: [String]?
    let date: String
}
