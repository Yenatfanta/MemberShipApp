//
//  GroupViewModel.swift
//  ChurchMemberShipApp
//
//  Created by Yenat Feyyisa on 2/9/25.
//

import Foundation
final class GroupViewModel: ObservableObject {
    private let dataReader: DataReadUseCase
    @Published var groups: [ChurchGroup] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var searchText = ""
    init(dataReader: DataReadUseCase = DataReadImplementation()) {
        self.dataReader = dataReader
        Task {
            await readGroups()
        }
    }
    var filteredGroups: [ChurchGroup] {
        guard !searchText.isEmpty else {
            return groups
        }
       return  groups.filter {
            $0.name.localizedCaseInsensitiveContains(searchText)
            || $0.description?.localizedCaseInsensitiveContains(searchText) ?? false
        }
    }
    @MainActor
    func readGroups() async {
        isLoading = true
        errorMessage = nil
        do {
            groups = try await dataReader.loadJson(fileName: "groups", type: [ChurchGroup].self)
        } catch let error as DataReadError {
            errorMessage = error.localizedDescription
        } catch {
            errorMessage = "An unexpected error occured"
        }
        isLoading = false
    }
}
