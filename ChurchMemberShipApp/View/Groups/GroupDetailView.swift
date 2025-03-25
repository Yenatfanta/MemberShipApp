//
//  GroupDetailView.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/9/25.
//

import SwiftUI

struct GroupDetailView: View {
    let group: ChurchGroup
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                 HeaderCard(group: group)
                VStack(spacing: 24) {
                    if let description = group.description {
                        InfoSection(title: "About",
                                    icon: "info.circle.fill") {
                            Text(description)
                                .foregroundStyle(.secondary)
                        }
                    }
                    InfoSection(
                        title: "Members",
                        icon: "person.3.fill",
                        countBadge: group.memberIds.count
                    ) {
                        MemberGrid(memberIds: group.memberIds)
                    }
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
struct HeaderCard: View {
    let group: ChurchGroup
    var body: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color.orange.opacity(0.1))
                    .frame(width: 80, height: 80)
                Image(systemName: "rectangle.stack.person.crop.fill")
                    .font(.system(size: 30))
                    .foregroundStyle(.orange)
            }
            .padding()
            Text(group.name)
            HStack(spacing: 24) {
                StatItem(
                    title: "Members",
                    value: "\(group.memberIds.count)",
                    icon: "person.3.fill"
                )
                StatItem(title: "Created", value: "2024", icon: "calendar")
            }
            .padding(.bottom)
        }
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.1), radius: 10)
    }
}
struct StatItem: View {
    let title: String
    let value: String
    let icon: String
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundStyle(.orange)
            Text(value)
                .font(.headline)
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}
struct InfoSection<Content: View>: View {
    let title: String
    let icon: String
    var countBadge: Int?
    @ViewBuilder let content: Content
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Label(title, systemImage: icon)
                    .font(.headline)
                if let count = countBadge {
                    Spacer()
                    Text("\(count)")
                        .font(.subheadline)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.orange)
                        .foregroundStyle(.white)
                        .cornerRadius(8)
                }
            }
            content
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 5)
    }
}
struct MemberGrid: View {
    let memberIds: [String]
    let columns = Array(repeating: GridItem(.flexible(), spacing: 16), count: 2)
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(memberIds, id: \.self) { memberId in
                MemberCell(memberId: memberId)
            }
        }
    }
}
struct MemberCell: View {
    let memberId: String
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .fill(.white)
                .frame(width: 40, height: 40)
                .overlay(
                    Image(systemName: "person.fill")
                        .foregroundStyle(.orange)
                )
            VStack(alignment: .leading, spacing: 4) {
                Text("Member \(memberId)")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
            }
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}
struct GroupDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GroupDetailView(group: ChurchGroup(
                id: "1",
                name: "Youth Ministry",
                description: "Youth Ministry is a dedicated church group.",
                memberIds: ["1", "2", "3", "4", "5"]
            ))
        }
    }
}
