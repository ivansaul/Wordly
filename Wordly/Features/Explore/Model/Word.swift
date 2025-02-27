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
    let id: String
    let level: Level
    let value: String
    let meaning: Meaning
    let transcription: Transcription
    let sound: Sound
    let translations: [Translation]
    let definitions: [Definition]
    let examples: [Example]?
}

struct Meaning: Codable, Hashable {
    let pos: Pos?
    let value: [String]
}

struct Transcription: Codable, Hashable {
    let uk: String
    let us: String
}

struct Sound: Codable, Hashable {
    let uk: String
    let us: String
}

struct Definition: Codable, Hashable {
    let pos: Pos
    let value: String
    let example: Example?
}

struct Example: Codable, Hashable {
    let en: String
    let es: String
}

struct Translation: Codable, Hashable {
    let pos: Pos
    let value: String
    let reverseTranslation: [String]

    enum CodingKeys: String, CodingKey {
        case pos, value
        case reverseTranslation = "reverse_translation"
    }
}

enum Level: String, Codable, Hashable {
    case a1
    case a2
    case b1
    case b2
    case c1
}

enum Pos: String, Codable, Hashable {
    case abbreviation
    case adjective
    case adverb
    case article
    case auxiliaryVerb = "auxiliary verb"
    case combiningForm = "combining form"
    case conjunction
    case contraction
    case exclamation
    case interjection
    case noun
    case particle
    case phrase
    case prefix
    case preposition
    case pronoun
    case suffix
    case symbol
    case verb
    case unknown

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        self = Pos(rawValue: rawValue) ?? .unknown
    }
}
