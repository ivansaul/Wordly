//
//  WordDataService.swift
//  Wordly
//
//  Created by @ivansaul on 2/23/25.
//
//  https://github.com/ivansaul
//

import Foundation

protocol WordDataServiceProtocol {
    func fetchWords() async throws -> [Word]
}

final class WordDataService: WordDataServiceProtocol {
    func fetchWords() async throws -> [Word] {
        .mock
    }
}
