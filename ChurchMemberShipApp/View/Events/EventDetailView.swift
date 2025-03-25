//
//  EventDetailView.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/9/25.
//

import SwiftUI

struct EventDetailView: View {
    let event: Event
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let imageUrl = event.imageUrl, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .clipped()
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .foregroundColor(.gray)
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text(event.name)
                        .font(.title)
                        .bold()
                    HStack {
                        Image(systemName: "calendar")
                        Text(event.date)
                    }
                    .foregroundStyle(.gray)
                    if let description = event.description {
                        Text("About")
                            .font(.headline)
                            .padding(.top)
                        Text(description)
                            .foregroundStyle(.secondary)
                    }
                    if let attendees = event.attendees {
                        Text("Attendees")
                            .font(.headline)
                            .padding(.top)
                        ForEach(attendees, id: \.self) { attendee in
                            HStack {
                                Image(systemName: "person.circle")
                                Text(attendee)
                            }
                            .foregroundStyle(.secondary)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

// #Preview {
//    EventDetailView()
// }
