//
//  TopBarView.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/8/25.
//

import SwiftUI
struct SideMenu: View {
    @EnvironmentObject var coordinator: DashboardCoordinator
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Menu")
                        .font(.title2)
                        .bold()
                    Divider()
                }
                .padding()
                ScrollView {
                    VStack(alignment: .leading, spacing: 5) {
                        MenuLink(title: "Events", icon: "calendar") {
                            coordinator.navigate(to: .event)
                        }
//                        MenuLink(title: "Activities", icon: "building.2.fill") {
//                            coordinator.navigate(to: .churchActivity)
//                        }
                        MenuLink(title: "Groups", icon: "person.3.fill") {
                            coordinator.navigate(to: .groups)
                        }
                        MenuLink(title: "Payment", icon: "creditcard") {
                            coordinator.navigate(to: .payment)
                        }
                        MenuLink(title: "Sign Out", icon: "rectangle.portrait.and.arrow.right") {
                            coordinator.navigate(to: .signOut)
                        }
                    }
                    .padding(.top)
                }
            }
            .frame(width: Metrics.menuWidth)
            .background(Color.white)
            .shadow(radius: 10)
            Spacer()
        }
        .transition(.move(edge: .leading))
        .zIndex(1)
    }
}
struct MenuLink: View {
    let title: String
    let icon: String
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .frame(width: 24)
                    .foregroundStyle(.black)
                    .bold()
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.white)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
            .background(Color.orange)
            .cornerRadius(8)
        }
    }
}
#Preview {
    SideMenu()
}
