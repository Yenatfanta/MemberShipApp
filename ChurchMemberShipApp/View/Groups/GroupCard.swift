//
//  GroupCard.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/9/25.
//

import SwiftUI
struct GroupCard: View {
    let group: ChurchGroup
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(group.name)
                .font(.headline)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color.orange)
                .cornerRadius(8)
            if let description = group.description {
                Text(description)
                    .font(.subheadline)
                    .foregroundStyle(.black)
                    .lineLimit(2)
                    .padding(.horizontal, 12)
            }
            Spacer()
            HStack {
                Image(systemName: "person.3.fill")
                    .foregroundStyle(.orange)
                Text("\(group.memberIds.count) members")
                    .font(.footnote)
                    .foregroundStyle(.black)
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 12)
        }
        .frame(height: 160)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.orange.opacity(0.2), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}
