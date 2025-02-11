//
//  PaymentView.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/8/25.
//

import SwiftUI

struct PaymentView: View {
    @StateObject private var viewModel: PaymentMethodViewModel = PaymentMethodViewModel()
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 8) {
                Text("Payment Amount")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Text("$\(String(format: "%.2f", viewModel.amount))")
                    .font(.system(size: 36, weight: .bold))
            }
            .padding(.top, 32)
            PaymentMethodList(
                methods: viewModel.paymentMethods,
                selectedMethod: $viewModel.selectedPaymentMethod,
                onSelect: { method in
                    viewModel.selectPaymentMethod(method)
                }
                )
            Spacer()
            PayButton(
                amount: viewModel.amount,
                isProcessing: viewModel.isProcessingPayment,
                isEnabled: viewModel.selectedPaymentMethod != nil,
                onTap: viewModel.processPayment
            )
            .padding(.horizontal)
            .padding(.bottom, 32)
        }
        .padding()
        .navigationTitle("Payment")
        .alert("Payment Successful", isPresented: $viewModel.showingPaymentSheet) {
            Button("OK", role: .cancel) { }
        }
    }
}
struct PayButton: View {
    let amount: Double
    let isProcessing: Bool
    let isEnabled: Bool
    let onTap: () -> Void
    var body: some View {
        Button(action: onTap) {
            if isProcessing {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
            } else {
                Text("Pay $\(String(format: "%.2f", amount))")
                    .font(.subheadline)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background {
            if isEnabled {
                LinearGradient(
                    gradient: Gradient(colors: [Color.orange, Color.red.opacity(0.8)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ) } else {
                    Color.orange.opacity(0.1)
                }
        }
        .foregroundStyle(isEnabled ? .white : .black)
        .cornerRadius(16)
        .shadow(color: isEnabled ? .orange.opacity(0.4) : .clear, radius: 6)
        .disabled(!isEnabled || isProcessing)
    }
}
#Preview {
    PaymentView()
}
