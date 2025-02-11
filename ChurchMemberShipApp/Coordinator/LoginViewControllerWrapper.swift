//
//  LoginViewControllerWrapper.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/9/25.
//

import SwiftUI
struct LoginViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let loginController = storyBoard.instantiateViewController(
            identifier: "LoginViewController"
        ) as LoginViewController
        return loginController
    }
    func updateUIViewController( _ uiViewController: UIViewControllerType,
        context: Context) {
        
    }
}
