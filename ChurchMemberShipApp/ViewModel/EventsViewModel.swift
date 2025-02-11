//
//  EventsViewModel.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/7/25.
//

import Foundation
final class EventsViewModel: ObservableObject {
    private var dataReader: DataReadUseCase
    @Published var events: [Event] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var searchText = ""
    init (dataReader: DataReadUseCase = DataReadImplementation()) {
        self.dataReader = dataReader
        Task {
            await readEvents()
        }
    }
    var filteredEvents: [Event] {
        guard !searchText.isEmpty else {return events}
        return events.filter {
            $0.name.localizedCaseInsensitiveContains(searchText) ||
            $0.description?.localizedCaseInsensitiveContains(searchText) ?? false
        }
    }
    @MainActor
    func readEvents() async {
        isLoading = true
        errorMessage = nil
        do {
            events = try await dataReader
                .loadJson(fileName: "events", type: [Event].self)
        } catch let error as DataReadError {
            errorMessage = error.localizedDescription
        } catch {
            errorMessage = "An unexpected error occurred"
        }
        isLoading = false
    }
}
