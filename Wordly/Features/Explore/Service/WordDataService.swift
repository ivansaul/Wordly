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
    func fetchRandomWord() async throws -> Word
}

final class WordDataService: WordDataServiceProtocol {
    private let mockWord: Word = .mock
    private let mockWords: [Word] = .mock

    func fetchWords() async throws -> [Word] {
        mockWords
    }

    func fetchRandomWord() async throws -> Word {
        mockWords.randomElement() ?? mockWord
    }
}
