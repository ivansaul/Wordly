//
//  Word.swift
//  Wordly
//
//  Created by @ivansaul on 2/23/25.
//
//  https://github.com/ivansaul
//

import Foundation

struct Word: Codable, Identifiable, Hashable {
    let word: String
    let ipa: IPA
    let meanings: [String]
    let examples: [Example]
    let audio: Audio
}

struct IPA: Codable, Hashable {
    let uk: String
    let us: String
}

struct Example: Codable, Hashable {
    let en: String
    let es: String
}

struct Audio: Codable, Hashable {
    let uk: String
    let us: String
}

extension Word {
    var id: String {
        self.word
    }
}
