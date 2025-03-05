//
//  PreviewData.swift
//  Wordly
//
//  Created by @ivansaul on 2/23/25.
//
//  https://github.com/ivansaul
//

import Foundation

extension [Word] {
    static var mock: [Word] {
        let url = Bundle.main.url(forResource: "words", withExtension: "json")!
        let data = try! Data(contentsOf: url)

        return try! JSONDecoder().decode([Word].self, from: data)
    }
}

extension Word {
    static let mock: Word = [Word].mock[337]
}

extension Example {
    static let mock: Example = Word.mock.examples?.first!
        ?? Example(en: "Hello, world", es: "Hola, mundo")
}

extension [Example] {
    static let mock: [Example] = Word.mock.examples ?? []
}

extension [VerbConjugation] {
    static var mock: [VerbConjugation] {
        let url = Bundle.main.url(forResource: "IrreVerbs", withExtension: "json")!
        let data = try! Data(contentsOf: url)

        return try! JSONDecoder().decode([VerbConjugation].self, from: data)
    }
}

extension VerbConjugation {
    static let mock = [VerbConjugation].mock.first!
}
