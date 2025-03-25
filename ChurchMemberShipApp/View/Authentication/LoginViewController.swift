//
//  LoginViewController.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/4/25.
//

import UIKit

class LoginViewController: UIViewController {
  @IBOutlet weak var loginSubtitle: UILabel!
  @IBOutlet weak var loginTitle: UILabel!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var signUpButton: UIButton!
  @IBOutlet weak var signUpLabel: UILabel!
  @IBOutlet weak var loginButton: UIButton!
  var coordinator: AppCoordinator?
    @IBOutlet weak var errorLabel: UILabel!
    private let fbViewModel = FirebaseLoginViewModel()
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.setHidesBackButton(true, animated: true)
    setUpUI()
  }
  func setUpUI() {
    loginTitle.text = StringConstant.loginLabel
    loginTitle.textColor = .text
    loginSubtitle.text = StringConstant.signInLabel
    loginSubtitle.font = .boldSystemFont(ofSize: 16)
    loginSubtitle.textColor = .text.withAlphaComponent(0.7)
    setUpTextField(emailTextField, StringConstant.emailPlaceHolder)
    emailTextField.setIcon(UIImage(systemName: "envelope") ?? UIImage())
    emailTextField.addTarget(
      self, action: #selector(textFieldDidBeginEditing), for: .editingDidBegin)
    emailTextField.addTarget(self, action: #selector(textFieldDidEndEditing), for: .editingDidEnd)
    passwordTextField.addTarget(
      self, action: #selector(textFieldDidBeginEditing), for: .editingDidBegin)
    passwordTextField.addTarget(
      self, action: #selector(textFieldDidEndEditing), for: .editingDidEnd)
    setUpTextField(passwordTextField, StringConstant.passwordPlaceHolder)
    passwordTextField.setIcon(UIImage(systemName: "lock") ?? UIImage())
    loginButton.layer.cornerRadius = 10
    signUpButton.setTitleColor(.primary, for: .normal)
  }
  private func setUpTextField(_ textField: UITextField, _ placeHolder: String) {
    textField.backgroundColor = .white
    textField.layer.cornerRadius = 10
    textField.layer.borderWidth = 1
    textField.layer.borderColor = UIColor.lightGray.cgColor
    textField.placeholder = placeHolder
  }
  @objc private func textFieldDidBeginEditing(_ textField: UITextField) {
    textField.addShadow()
  }
  @objc private func textFieldDidEndEditing(_ textField: UITextField) {
    textField.layer.shadowOpacity = 0
  }
  @IBAction func login(_ sender: Any) {
      guard let email = emailTextField.text,
            !email.isEmpty,
            let password = passwordTextField.text,
            !password.isEmpty else {
          errorLabel.text = "All fields are required*"
          errorLabel.isHidden = false
          return
      }
      fbViewModel.login(email: email, password: password) { [weak self] success, error in
          if success {
              self?.coordinator?.showDashboard()
              print("Logged in")
          } else {
              self?.errorLabel.text = error
              self?.errorLabel.isHidden = false
          }
      }
  }
    @IBAction func signUpAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyBoard.instantiateViewController(
            withIdentifier: "SignUpViewController") as? SignUpViewController {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
