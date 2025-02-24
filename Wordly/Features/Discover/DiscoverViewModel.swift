//
//  DiscoverViewModel.swift
//  Wordly
//
//  Created by @ivansaul on 2/24/25.
//
//  https://github.com/ivansaul
//

import Foundation

@Observable
final class DiscoverViewModel {
    private(set) var word: Word = .mock

    private(set) var isLoading: Bool = false
    private(set) var errorMessage: String = ""
    var showAlert: Bool = false

    private let wordDataService: WordDataServiceProtocol

    init(wordDataService: WordDataServiceProtocol) {
        self.wordDataService = wordDataService

        Task { await fetchRandomWord() }
    }

    @MainActor
    func fetchRandomWord() async {
        guard !isLoading else { return }
        defer { isLoading = false }

        isLoading = true

        do {
            word = try await wordDataService.fetchRandomWord()
        } catch {
            handleError(error)
        }
    }
}

extension DiscoverViewModel {
    @MainActor
    private func handleError(_ error: Error) {
        isLoading = false
        showAlert = true
        errorMessage = error.localizedDescription
    }
}
