//
//  ExplorerViewModel.swift
//  Wordly
//
//  Created by @ivansaul on 2/23/25.
//
//  https://github.com/ivansaul
//

import AsyncAlgorithms
import Foundation

@Observable
final class ExplorerViewModel {
    private(set) var words: [Word] = []
    private(set) var filteredWords: [Word] = []

    var searchText: String = "" {
        didSet { Task { await searchTextChannel.send(searchText) }}
    }

    private(set) var isLoading: Bool = false
    private(set) var errorMessage: String = ""
    var showAlert: Bool = false

    private let wordDataService: WordDataServiceProtocol
    private let searchTextChannel = AsyncChannel<String>()

    init(wordDataService: WordDataServiceProtocol) {
        self.wordDataService = wordDataService

        Task { await fetchWords() }
        Task { await addSubscribers() }
    }

    @MainActor
    private func fetchWords() async {
        do {
            words = try await wordDataService.fetchWords()
            filteredWords = words
        } catch {
            handleError(error)
        }
    }

    @MainActor
    private func addSubscribers() async {
        let stream = searchTextChannel
            .debounce(for: .milliseconds(300))
            .removeDuplicates()

        for await value in stream {
            filteredWords = filterWords(query: value)
        }
    }

    private func filterWords(query: String) -> [Word] {
        if query.isEmpty {
            return words
        }

        return words.filter { word in
            word.word.contains(query)
        }
    }

    @MainActor
    private func handleError(_ error: Error) {
        isLoading = false
        showAlert = true
        errorMessage = error.localizedDescription
    }
}
