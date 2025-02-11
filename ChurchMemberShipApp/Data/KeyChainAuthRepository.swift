//
//  KeyChainManager.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/6/25.
//

import Foundation
import SimpleKeychain
final class KeyChainAuthRepository: AuthenticationUseCase {
    static let  shared = KeyChainAuthRepository()
    private let userDefaults = UserDefaults.standard
    private init() {}
    private let keychain = SimpleKeychain(service: "techconsulting.ChurchMemberShipApp")
    func login(email: String, password: String) throws -> Bool {
        guard let storedPassword = try? keychain.string(forKey: email) else {
            throw AuthenticationError.userNotFound
        }
        guard storedPassword == password else {
            throw AuthenticationError.invalidEmail
        }
        try keychain.set(email, forKey: "currentUser")
        return true
    }
    func signUp(email: String, password: String, fullName: String) throws {
        guard (try? keychain.string(forKey: email)) == nil else {
            throw AuthenticationError.userAlreadyExists
        }
        try keychain.set(password, forKey: email)
        userDefaults.set(fullName, forKey: email + "_fullName")
    }

    func isUserLoggedIn() -> Bool {
        return (try? keychain.string(forKey: "currentUser")) != nil
    }
    func getFullName() -> String? {
        guard let currentUser = try? keychain.string(forKey: "currentUser") else {
            return nil
        }
        return userDefaults.string(forKey: currentUser + "_fullName")
    }
}
enum AuthenticationError: Error {
    case userNotFound, invalidEmail, userAlreadyExists, invalidPassword
    var errorDescription: String? {
        switch self {
        case .userNotFound:
            return StringConstant.userNotFoundError
        case .invalidEmail:
            return StringConstant.invalidEmail
        case .userAlreadyExists:
            return StringConstant.userAlreadyExistsError
        case .invalidPassword:
            return StringConstant.invalidPassword
        }
    }
}
