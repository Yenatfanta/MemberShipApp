//
//  EventsView.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/6/25.
//

import SwiftUI
struct EventsView: View {
    @StateObject private var viewModel = EventsViewModel()
    @State var searchText = ""
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView()
                    .scaleEffect(1.5)
            } else {
                eventList
            }
        }
        .navigationTitle("Events")
        .searchable(text: $viewModel.searchText, prompt: "Search events...")
        .alert("Error", isPresented: .constant(viewModel.errorMessage != nil)) {
            Button("OK") {
                viewModel.errorMessage = nil
            }
        } message: {
            Text(viewModel.errorMessage ?? "")
        }
    }
    private var eventList: some View {
        List(viewModel.filteredEvents) { event in
            NavigationLink(destination: EventDetailView(event: event)) {
                EventRowView(event: event)
            }
        }
        .listStyle(.plain)
        .refreshable {
            await viewModel.readEvents()
        }
    }
}

#Preview {
    NavigationStack {
        EventsView()
    }
}
