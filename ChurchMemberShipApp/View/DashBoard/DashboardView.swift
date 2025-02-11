//
//  DashboardView.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/6/25.
//
import SwiftUI
struct DashboardView: View {
    @StateObject private var viewModel: DashboardViewModel = DashboardViewModel()
    @EnvironmentObject private var coordinator: DashboardCoordinator
    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            ZStack {
                VStack(spacing: 20) {
                    topBar
                    ScrollView {
                        VStack(spacing: 25) {
                             heroSection
                            buttonSection
                        }
                        .padding(.horizontal)
                    }
                }
                .blur(radius: viewModel.isMenuOpen ? 8 : 0)
                .scaleEffect(viewModel.isMenuOpen ? 0.95 : 1.0)
                .disabled(viewModel.isMenuOpen)
                if viewModel.isMenuOpen {
                    SideMenu()
                }
                if viewModel.isMenuOpen {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                                viewModel.toggleMenu()
                            }
                        }
                }
            }
            .navigationDestination(for: DashboardDestination.self) { destination in
                coordinator.build(destination)
                    .environmentObject(viewModel)
                    .environmentObject(coordinator)
            }
        }
        .navigationBarHidden(true)
    }
    private var topBar: some View {
        HStack {
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                    viewModel.toggleMenu()
                }
            } label: {
                Image(systemName: "line.horizontal.3")
                    .font(.title2)
                    .foregroundStyle(.black)
                    .padding()
                    .background(
                        Circle()
                            .fill(Color.gray.opacity(0.1))
                            .frame(width: 40, height: 40)
                    )
            }
            Spacer()
        } .padding()
    }
    private var heroSection: some View {
        VStack(spacing: 16) {
            Image("church")
                .resizable()
                .scaledToFit()
                .cornerRadius(15)
                .shadow(radius: 5)
            VStack(spacing: 8) {
                Text("Ethiopian Orthodox Church")
                    .font(.system(.title, design: .serif))
                    .bold()
                Text("Select a page to continue")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
        }
    }
    private var buttonSection: some View {
            VStack(spacing: 12) {
                NavigationButton(title: "Groups", icon: "person.3.fill") {
                    coordinator.navigate(to: .groups) }
                NavigationButton(title: "Events", icon: "calendar") {
                    coordinator.navigate(to: .event) }
//                NavigationButton(
//                    title: "Church Activities",
//                    icon: "building.2.fill"
//                ) {
//                    coordinator.navigate(to: .churchActivity)
//                }
                NavigationButton(title: "Payment", icon: "creditcard.fill") {
                    coordinator.navigate(to: .payment)
                }
            }
        }
}
struct NavigationButton: View {
    let title: String
    let icon: String
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.title3)
                    .frame(width: 30)
                    .foregroundStyle(.white)
                    .bold()
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .bold()
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundStyle(.white)
            }
            .padding()
            .background(LinearGradient(
                gradient: Gradient(colors: [Color.orange, Color.red.opacity(0.8)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ))
            .cornerRadius(10)
        }
    }
}
#Preview {
    DashboardView()
        .environmentObject(DashboardCoordinator())
}
