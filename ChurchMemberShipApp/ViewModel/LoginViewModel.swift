//
//  SignInModel.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/6/25.
//

import Foundation
final class LoginViewModel {
    private  let authUseCase: AuthenticationUseCase
    var errorMessage: String?
    var isAuthenticated: Bool = false
    init(authUseCase: AuthenticationUseCase = KeyChainAuthRepository.shared ) {
        self.authUseCase = authUseCase
        isAuthenticated = authUseCase.isUserLoggedIn()
    }
    func login(email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        do {
            isAuthenticated = try authUseCase
                .login(email: email, password: password)
            completion(true, nil)
        } catch let error as AuthenticationError {
            completion(false, error.localizedDescription)
        } catch {
            completion(false, "An un expected error occurred")
        }
    }
}
