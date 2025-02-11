//
//  AppCoordinator.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/7/25.
//

import Foundation
import UIKit
import SwiftUI
class AppCoordinator {
    var window: UIWindow?
    var dashboardCoordinator: DashboardCoordinator?
    init(window: UIWindow? = nil) {
        self.window = window
    }
    func start() {
        showLogin()
    }
    func showLogin() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
      guard let loginViewController = storyBoard.instantiateViewController(
            withIdentifier: "LoginViewController"
      ) as? LoginViewController else {
          return
      }
        loginViewController.coordinator = self
        let navigationController = UINavigationController(rootViewController: loginViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    func showDashboard() {
        dashboardCoordinator  = DashboardCoordinator()
        let dashboardView = DashboardView()
            .environmentObject(dashboardCoordinator!)
        let hostingController = UIHostingController(rootView: dashboardView)
        window?.rootViewController = hostingController
        window?.makeKeyAndVisible()
    }

}
