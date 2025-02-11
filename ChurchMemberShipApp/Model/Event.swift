//
//  Event.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/4/25.
//

import Foundation
struct Event: Codable, Identifiable {
    let id: String
    let name: String
    let description: String?
    let date: String
    let location: String
    let attendees: [String]?
    let imageUrl: String?
}
