//
//  IrreVerbsViewModel.swift
//  Wordly
//
//  Created by @ivansaul on 3/4/25.
//
//  https://github.com/ivansaul
//

import AsyncAlgorithms
import Foundation

@Observable
final class VerbsViewModel {
    private(set) var verbs: [VerbConjugation] = []
    private(set) var filteredVerbs: [VerbConjugation] = []

    var searchText: String = "" {
        didSet { Task { await searchTextChannel.send(searchText) }}
    }

    private(set) var isLoading: Bool = false
    private(set) var errorMessage: String = ""
    var showAlert: Bool = false

    private let verbDataService: VerbDataServiceProtocol
    private let searchTextChannel = AsyncChannel<String>()

    init(verbDataService: VerbDataServiceProtocol) {
        self.verbDataService = verbDataService

        Task { await fetchVerbs() }
        Task { await addSubscribers() }
    }

    @MainActor
    private func fetchVerbs() async {
        do {
            verbs = try await verbDataService.fetchVerbs()
            filteredVerbs = verbs
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
            filteredVerbs = filterVerbs(query: value)
        }
    }

    private func filterVerbs(query: String) -> [VerbConjugation] {
        guard !query.isEmpty else { return verbs }

        return verbs.filter { conjugation in

            let joinedVerbs = conjugation.baseForm
                + conjugation.pastSimple
                + conjugation.pastParticiple

            return joinedVerbs
                .lazy
                .contains {
                    $0.value.lowercased()
                        .contains(query.lowercased())
                }
        }
    }

    @MainActor
    private func handleError(_ error: Error) {
        isLoading = false
        showAlert = true
        errorMessage = error.localizedDescription
    }
}
