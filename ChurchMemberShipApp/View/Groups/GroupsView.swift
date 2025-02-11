//
//  HomeView.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/6/25.
//

import SwiftUI

struct GroupsView: View {
    let columns = [
        GridItem(.adaptive(minimum: 160, maximum: 200), spacing: 16)
    ]
    @StateObject private var viewModel = GroupViewModel()
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(viewModel.filteredGroups) { group in
                            NavigationLink(destination: GroupDetailView(group: group)) {
                                GroupCard(group: group)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Church Groups")
        .searchable(text: $viewModel.searchText, prompt: "Search Groups...")
        .refreshable {
            await viewModel.readGroups()
        }
        .alert("Error", isPresented: .constant(viewModel.errorMessage != nil)) {
            Button("OK") {
                viewModel.errorMessage = nil
            }
        } message: {
            Text(viewModel.errorMessage ?? "")
        }
    }
}
#Preview {
    GroupsView()
}
