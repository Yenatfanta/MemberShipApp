//
//  DataReadError.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/9/25.
//

import Foundation
enum DataReadError: Error {
    case fileNotFound
    case decodingError
    case invalidData
    var message: String {
        switch self {
        case .fileNotFound:
            return "The data file could not be found"
        case .decodingError:
            return "Unable to decode the data"
        case .invalidData:
            return "The data is invalid"
        }
    }
}
