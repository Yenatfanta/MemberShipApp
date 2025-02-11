//
//  LoginViewModelTest.swift
//  ChurchMemberShipAppTests
//
//  Created by Yenat Feyyisa on 2/10/25.
//

import XCTest
@testable import ChurchMemberShipApp
final class LoginViewModelTest: XCTestCase {
    var authUseCase: MockAuthUseCase!
    var viewModel: LoginViewModel!
    override func setUp() {
        authUseCase = MockAuthUseCase()
        viewModel = LoginViewModel(authUseCase: authUseCase)
    }
    override func tearDown() {
        authUseCase = nil
        viewModel = nil
    }
    func testLoginWithValidCredentialsShouldSucceed() {
        authUseCase.loginShouldSucceed = true
        viewModel.login(email: "test@example.com", password: "ValidPassword23") {success, error in
            XCTAssertTrue(success)
            XCTAssertNil(error)
            XCTAssertTrue(self.viewModel.isAuthenticated)
        }
    }
    func testLoginWithInvalidEmailShouldFail() {
        authUseCase.loginShouldSucceed = false
        authUseCase.loginError = AuthenticationError.invalidEmail
        viewModel.login(email: "test", password: "ValidPassword23") { success, error in
            XCTAssertFalse(success)
            XCTAssertEqual(error, AuthenticationError.invalidEmail.localizedDescription)
            XCTAssertFalse(self.viewModel.isAuthenticated)

        }
    }
    
}
