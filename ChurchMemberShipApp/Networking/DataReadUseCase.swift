//
//  DataRead.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/7/25.
//

import Foundation
protocol DataReadUseCase {
    func loadJson<T: Codable> (fileName: String, type: T.Type) async throws -> T
}
