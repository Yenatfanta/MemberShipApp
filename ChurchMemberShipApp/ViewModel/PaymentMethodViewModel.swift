//
//  PaymentMethodViewModel.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/9/25.
//

import Foundation
final class PaymentMethodViewModel: ObservableObject {
    @Published var selectedPaymentMethod: PaymentMethod?
    @Published var showingPaymentSheet = false
    @Published var isProcessingPayment = false
    let amount: Double
    init(amount: Double = 99.99) {
        self.amount = amount
    }
    let paymentMethods: [PaymentMethod] = [
        PaymentMethod(name: "Apple Pay", icon: "apple.logo", type: .applePay),
        PaymentMethod(name: "PayPal", icon: "dollarsign.circle.fill", type: .payPal),
        PaymentMethod(name: "Credit/Debit Card", icon: "creditcard.fill", type: .card)
    ]
    func selectPaymentMethod(_ method: PaymentMethod) {
        selectedPaymentMethod = method
    }
    func processPayment() {
            guard selectedPaymentMethod != nil else { return }
            isProcessingPayment = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.isProcessingPayment = false
                self.showingPaymentSheet = true
                // Integrate with payment processor here
            }
        }
}
