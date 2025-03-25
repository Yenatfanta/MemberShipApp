//
//  FirebaseLoginViewModel.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 3/25/25.
//

import Foundation
final class FirebaseLoginViewModel {
    private let authManager: FirebaseAuthManagerProtocol
    var errorMessage: String?
    var isLoggedIn: Bool = false
    // MARK: - Initialization
    init(authManager: FirebaseAuthManagerProtocol = FirebaseAuthManager()) {
        self.authManager = authManager
    }
}
// MARK: - authentication logic
extension FirebaseLoginViewModel {
    func login(email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        authManager.signIn(email: email, password: password) {[weak self] result in
            switch result {
            case .success(let user):
                self?.isLoggedIn = true
                completion(true, nil)
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
                completion(false, self?.errorMessage)
            }
        }
    }
    func signUp(email: String, password: String, fullName: String, completion: @escaping (Bool, String?) -> Void) {
        guard validateEmail(email) else {
                        completion(false, AuthenticationError.invalidEmail.localizedDescription)
            return
        }
        guard validatePassword(password) else {
            completion(false, AuthenticationError.invalidPassword.localizedDescription)
            return
        }
        authManager
            .createAccount(email: email, password: password, fullName: fullName) { [weak self] result in
            switch result {
            case .success(let user):
                self?.isLoggedIn = true
                completion(true, nil)
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
                completion(false, self?.errorMessage)
            }
        }
    }
    func validateEmail(_ email: String) -> Bool {
        let emailRegex = #"^[A-Za-z0-9._%+-]+@([A-Za-z0-9-]+\.)+[A-Za-z]{2,}$"#
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return false
        }
        return emailPredicate.evaluate(with: email)
    }

    func validatePassword(_ password: String) -> Bool {
       return password.count >= 8 &&
        password.rangeOfCharacter(from: .uppercaseLetters) != nil &&
        password.rangeOfCharacter(from: .lowercaseLetters) != nil &&
        password.rangeOfCharacter(from: .decimalDigits) != nil
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
