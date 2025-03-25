//
//  FirebaseAuthManager.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 3/25/25.
//

import Foundation
import FirebaseAuth
protocol FirebaseAuthManagerProtocol {
    func createAccount(email: String,
                       password: String,
                       fullName: String,
                       completion: @escaping (Result<User, Error>) -> Void)
    func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
    func signOut(completion: @escaping (Error?) -> Void)
    func resetPassword(email: String, completion: @escaping (Error?) -> Void)
    func isLoggedIn() -> Bool
}
final class FirebaseAuthManager: FirebaseAuthManagerProtocol {
    // MARK: - Create account
    func createAccount(
        email: String,
        password: String,
        fullName: String,
        completion: @escaping (Result<User, Error>) -> Void) {
            Auth.auth().createUser(withEmail: email, password: password) {result, error in
                if let error = error {
                    completion(.failure(error))
                } else if let authUser = result?.user {
                    let user = User(
                        id: authUser.uid,
                        name: fullName,
                        phoneNumber: "",
                        email: authUser.email,
                        membershipStatus: "",
                        groupIds: [],
                        address: "",
                        role: UserRole.admin
                    )
                    completion(.success(user))
                }
            }
    }
    // MARK: - Sign In
    func signIn(
        email: String,
        password: String,
        completion: @escaping (Result<User, any Error>) -> Void) {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                    if let error = error {
                        completion(.failure(error))
                    } else if let authUser = result?.user {
                        let user = User(
                            id: authUser.uid,
                            name: "",
                            phoneNumber: "",
                            email: authUser.email,
                            membershipStatus: "",
                            groupIds: [],
                            address: "",
                            role: UserRole.admin
                        )
                        completion(.success(user))
                    }
            }
    }
    // MARK: - Sign Out
    func signOut(completion: @escaping (Error?) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(nil)
        } catch {
            completion(error)
        }
    }
    // MARK: Reset Password
    func resetPassword(email: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            completion(error)
        }
    }
    // MARK: - Is Logged in
    func isLoggedIn() -> Bool {
        Auth.auth().currentUser != nil
    }
 }
