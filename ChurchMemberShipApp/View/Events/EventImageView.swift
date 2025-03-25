//
//  EventImageView.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/9/25.
//

import SwiftUI

struct EventImageView: View {
    let imageUrl: String?
    var body: some View {
        Group {
            if let imageUrl = imageUrl, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                    case .failure:
                        Image("church")
                            .foregroundStyle(.gray)
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Image("church")
                    .foregroundStyle(.gray)
            }
        }
        .frame(width: 80, height: 80)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
    }
}
