//
//  AmountSection.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/9/25.
//

import SwiftUI

struct PaymentMethodList: View {
    let methods: [PaymentMethod]
    @Binding var selectedMethod: PaymentMethod?
    let onSelect: (PaymentMethod) -> Void
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Select Payment Method")
                .font(.headline)
            ForEach(methods) { method in
                PaymentRow(
                    method: method,
                    isSelected: selectedMethod?.id == method.id
                )
                .onTapGesture {
                        onSelect(method)
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}
struct PaymentRow: View {
    let method: PaymentMethod
    let isSelected: Bool
    var body: some View {
        HStack {
            Image(systemName: method.icon)
                .font(.title2)
                .frame(width: 32)
                .foregroundStyle(isSelected ? .white : .black)
            Text(method.name)
                .font(.body)
                .fontWeight(isSelected ? .bold : .regular)
                .foregroundStyle(isSelected ? .white : .black)
            Spacer()
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(.white)
            }
        }
        .padding()
        .background {
            if isSelected {
                    LinearGradient(
                        gradient: Gradient(colors: [Color.orange, Color.red.opacity(0.8)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                } else {
                    Color.orange.opacity(0.1)
                }
        }
        .foregroundStyle(.white)
        .shadow(color: isSelected ? .orange.opacity(0.5) : .clear, radius: 4)
    }
}
