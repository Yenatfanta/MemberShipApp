//
//  EventRowView.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/9/25.
//

import SwiftUI

struct EventRowView: View {
    let event: Event
    var body: some View {
        HStack {
            EventImageView(imageUrl: event.imageUrl)
            VStack(alignment: .leading, spacing: 5) {
                Text(event.name)
                    .font(.headline)
                    .lineLimit(1)
                Text(event.name)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                if let description = event.description {
                    Text(description)
                        .font(.body)
                        .foregroundStyle(.secondary)
                        .lineLimit(2)
                }
                HStack {
                    Image(systemName: "location")
                    Text(event.location)
                        .font(.caption)
                }
                .foregroundStyle(.gray)
                if let attendees = event.attendees {
                    HStack {
                        Image(systemName: "person.2")
                        Text("\(attendees.count) attendees")
                            .font(.caption)
                    }
                    .foregroundStyle(.gray)
                }
            }
        }
        .padding(.vertical, 8)
    }
}

// #Preview {
//    EventRowView()
// }
