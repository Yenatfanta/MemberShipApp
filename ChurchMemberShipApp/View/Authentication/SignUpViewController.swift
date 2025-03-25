//
//  RegisterViewController.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/4/25.
//

import UIKit

final class SignUpViewController: UIViewController {
  @IBOutlet weak var fullNameTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var confirmPassword: UITextField!
  @IBOutlet weak var errorLabel: UILabel!
  private let fbViewModel = FirebaseLoginViewModel()
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.setHidesBackButton(true, animated: true)
      setUpUI()
  }
    func setUpUI() {
        fullNameTextField
            .addTarget(
                self,
                action: #selector(textFieldDidBeginEditing),
                for: .editingDidBegin
            )
        fullNameTextField
            .addTarget(
                self,
                action: #selector(textFieldDidEndEditing),
                for: .editingDidEnd
            )
        emailTextField
            .addTarget(
                self,
                action: #selector(textFieldDidBeginEditing),
                for: .editingDidBegin
            )
        emailTextField
            .addTarget(
                self,
                action: #selector(textFieldDidEndEditing),
                for: .editingDidEnd
            )
        passwordTextField
            .addTarget(
                self,
                action: #selector(textFieldDidBeginEditing),
                for: .editingDidBegin
            )
        passwordTextField
            .addTarget(
                self,
                action: #selector(textFieldDidEndEditing),
                for: .editingDidEnd
            )
        confirmPassword
            .addTarget(
                self,
                action: #selector(textFieldDidBeginEditing),
                for: .editingDidBegin
            )
        confirmPassword
            .addTarget(
                self,
                action: #selector(textFieldDidEndEditing),
                for: .editingDidEnd
            )
    }
  @IBAction func signUp(_ sender: Any) {
    guard let email = emailTextField.text,
      !email.isEmpty,
      let fullName = fullNameTextField.text,
      !fullName.isEmpty,
      let password = passwordTextField.text,
      let confirmPassword = confirmPassword.text else {
        errorLabel.text = "All fields are required.*"
        errorLabel.isHidden = false
        return
    }
      guard password == confirmPassword else {
          errorLabel.text = "Passwords do not match."
          errorLabel.isHidden = false
          return
      }
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    guard
      let loginViewController = storyBoard.instantiateViewController(
        withIdentifier: "LoginViewController"
      ) as? LoginViewController else {
            return
    }
      fbViewModel
          .signUp(
            email: email,
            password: password,
            fullName: fullName) { [weak self] success, errorMessage in
                DispatchQueue.main.async {
                    if success {
                        self?.navigationController?
                            .pushViewController(loginViewController, animated: true)
                    } else {
                        self?.errorLabel.text = errorMessage
                        self?.errorLabel.isHidden = false
                    }
                }

            }
  }
    @objc private func textFieldDidBeginEditing(_ textField: UITextField) {
      textField.addShadow()
    }
    @objc private func textFieldDidEndEditing(_ textField: UITextField) {
      textField.layer.shadowOpacity = 0
    }
    @IBAction func signInAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyBoard.instantiateViewController(
            withIdentifier: "LoginViewController") as? LoginViewController {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
