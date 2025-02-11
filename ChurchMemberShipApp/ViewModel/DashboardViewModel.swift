//
//  DashboardViewModel.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/8/25.
//

import Foundation
final class DashboardViewModel: ObservableObject {
    @Published var isMenuOpen = false
    func toggleMenu() {
        isMenuOpen.toggle()
    }
}
