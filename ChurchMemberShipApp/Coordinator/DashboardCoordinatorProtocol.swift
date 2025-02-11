//
//  DashboardCoordinator.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/8/25.
//

import Foundation
import SwiftUI
protocol DashboardCoordinatorProtocol {
    func navigate(to destination: DashboardDestination)
}
enum DashboardDestination: Hashable {
    case event, groups, churchActivity, payment, signOut
}
final class DashboardCoordinator: ObservableObject, DashboardCoordinatorProtocol {
    @Published var navigationPath = NavigationPath()
    func navigate(to destination: DashboardDestination) {
        navigationPath.append(destination)
    }
    @ViewBuilder
    func build(_ destination: DashboardDestination) -> some View {
        switch destination {
        case .groups:
            GroupsView()
        case .churchActivity:
            ChurchActivitiesView()
        case .payment:
            PaymentView()
        case .signOut:
            LoginViewControllerWrapper()
        case .event:
            EventsView()
        }
    }
    
}
