//
//  MockAuthUseCase.swift
//  ChurchMemberShipAppTests
//
//  Created by Yenat Feyyisa on 2/10/25.
//

import Foundation
@testable import ChurchMemberShipApp
final class MockAuthUseCase: AuthenticationUseCase {
        var validateEmailReturnValue: Bool = true
        var validatePasswordReturnValue: Bool = true
        var loginShouldSucceed: Bool = true
        var loginError: AuthenticationError?
        var signUpError: AuthenticationError?
        var fullName: String? = "Mock User"
        func validateEmail(_ email: String) -> Bool {
            return validateEmailReturnValue
        }
        func validatePassword(_ password: String) -> Bool {
            return validatePasswordReturnValue
        }
        func isUserLoggedIn() -> Bool {
           return loginShouldSucceed
       }
        func login(email: String, password: String) throws -> Bool {
            if let error = loginError {
                throw error
            }
            return loginShouldSucceed
        }
        func signUp(email: String, password: String, fullName: String) throws {
            if let signUpError = signUpError {
                throw signUpError
            }
        }
        func getFullName() -> String? {
            return fullName
        }
}
