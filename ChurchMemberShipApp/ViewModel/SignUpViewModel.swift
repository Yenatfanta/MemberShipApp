//
//  SignInViewModel.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/6/25.
//

import Foundation
final class SignUpViewModel {
    private  let authUseCase: AuthenticationUseCase
    var isAuthenticated: Bool = false
    init(authUseCase: AuthenticationUseCase = KeyChainAuthRepository.shared ) {
        self.authUseCase = authUseCase
        isAuthenticated = authUseCase.isUserLoggedIn()
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
        do {
             try authUseCase
                .signUp(email: email, password: password, fullName: fullName)
            isAuthenticated = true
            completion(true, nil)
        } catch let error as AuthenticationError {
            print(error.localizedDescription)
            completion(false, error.localizedDescription)
        } catch {
            completion(false, "An unexpected error occurred")
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
