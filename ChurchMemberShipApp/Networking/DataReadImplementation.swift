//
//  DataReadImplementation.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/7/25.
//

import Foundation
final class DataReadImplementation: DataReadUseCase {
    func loadJson<T: Codable>(fileName: String, type: T.Type) async throws -> T {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            throw DataReadError.fileNotFound
        }
        do {
            let data = try Data(contentsOf: url)
            let result = try JSONDecoder().decode(type, from: data)
            return result
        } catch {
            throw DataReadError.decodingError
        }
    }
}
