//
//  VerbDataService.swift
//  Wordly
//
//  Created by @ivansaul on 3/4/25.
//
//  https://github.com/ivansaul
//

import Foundation

protocol VerbDataServiceProtocol {
    func fetchVerbs() async throws -> [VerbConjugation]
}

final class VerbDataService: VerbDataServiceProtocol {
    private let mockVerbs: [VerbConjugation] = .mock

    func fetchVerbs() async throws -> [VerbConjugation] {
        mockVerbs
    }
}
