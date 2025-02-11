//
//  AuthUseCase.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/6/25.
//

import Foundation
protocol AuthenticationUseCase {
    func login(email: String, password: String) throws -> Bool
    func signUp(email: String, password: String, fullName: String) throws
    func isUserLoggedIn() -> Bool
    func getFullName() -> String?
}
