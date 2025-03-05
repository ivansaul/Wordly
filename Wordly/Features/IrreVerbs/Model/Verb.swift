//
//  Verb.swift
//  Wordly
//
//  Created by @ivansaul on 3/3/25.
//
//  https://github.com/ivansaul
//

import Foundation

struct Verb: Identifiable, Codable, Hashable {
    let id: String
    let value: String
    let transcription: String
    let sound: String
}

struct VerbConjugation: Codable, Hashable {
    let baseForm: [Verb]
    let pastSimple: [Verb]
    let pastParticiple: [Verb]
    let meanings: [String]
    let definitions: [String]
    let notes: String?

    enum CodingKeys: String, CodingKey {
        case baseForm = "base_form"
        case pastSimple = "past_simple"
        case pastParticiple = "past_participle"
        case meanings
        case definitions
        case notes
    }
}
