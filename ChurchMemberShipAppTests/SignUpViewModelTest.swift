//
//  SignUpViewModelTest.swift
//  ChurchMemberShipAppTests
//
//  Created by Yenat Feyyisa on 2/10/25.
//

import XCTest
@testable import ChurchMemberShipApp
final class SignUpViewModelTest: XCTestCase {
    var mockAuthUseCase: MockAuthUseCase!
    var viewModel: SignUpViewModel!
    override func setUp() {
        mockAuthUseCase = MockAuthUseCase()
        viewModel = SignUpViewModel(authUseCase: mockAuthUseCase)
    }
    override func tearDown() {
        mockAuthUseCase = nil
        viewModel = nil
    }
    func testValidateEmail() {
        // valid emails
        XCTAssertTrue(viewModel.validateEmail("test@example.com"))
        XCTAssertTrue(viewModel.validateEmail("user.name+alias@sub.domain.org"))
        XCTAssertTrue(viewModel.validateEmail("valid_email123@mail.net"))
        // invalid emails
        XCTAssertFalse(viewModel.validateEmail("invalid-email"))
        XCTAssertFalse(viewModel.validateEmail("user@.com"))
        XCTAssertFalse(viewModel.validateEmail("user@com"))
        XCTAssertFalse(viewModel.validateEmail("user@domain..com"))
        XCTAssertFalse(viewModel.validateEmail(" "))
        XCTAssertFalse(viewModel.validateEmail(""))
    }
    func testValidatePassword() {
        // valid passwords
        XCTAssertTrue(viewModel.validatePassword("Valid123"))
        XCTAssertTrue(viewModel.validatePassword("P4sswordX"))
        XCTAssertTrue(viewModel.validatePassword("Test1234A"))
        // invalid passwords
        XCTAssertFalse(viewModel.validatePassword("short"))
        XCTAssertFalse(viewModel.validatePassword("alllowercase"))
        XCTAssertFalse(viewModel.validatePassword("ALLUPPERCASE"))
        XCTAssertFalse(viewModel.validatePassword("12345678"))
        XCTAssertFalse(viewModel.validatePassword("NoNumbers"))
        XCTAssertFalse(viewModel.validatePassword(""))
    }
    func testSignUpWithValidCredentialsShouldSucceed() {
        viewModel.signUp(email: "valid@example.com", password: "Valid1234", fullName: "Test User") { success, error in
            XCTAssertTrue(success)
            XCTAssertNil(error)
        }
    }
    func testSignUpWithInvalidEmailShouldFail() {
        viewModel.signUp(email: "invalid", password: "Valid1234", fullName: "Test User") { success, error in
            XCTAssertFalse(success)
            XCTAssertEqual(error, AuthenticationError.invalidEmail.localizedDescription)
        }
    }
    func testSignUpWithInvalidPasswordShouldFail() {
        viewModel.signUp(email: "valid@example.com", password: "invalid", fullName: "Test User") { success, error in
            XCTAssertFalse(success)
            XCTAssertEqual(error, AuthenticationError.invalidPassword.localizedDescription)
        }
    }
    func testSignUpWithExistingUserShouldFail() {
        mockAuthUseCase.signUpError = AuthenticationError.userAlreadyExists
        viewModel.signUp(email: "valid@example.com", password: "Valid1234", fullName: "Test user") { success, error in
            XCTAssertFalse(success)
            XCTAssertEqual(error, AuthenticationError.userAlreadyExists.localizedDescription)
        }
    }
}
