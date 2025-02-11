//
//  MemberGroup.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/4/25.
//

import Foundation
struct ChurchGroup: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let description: String?
    let memberIds: [String]
}
