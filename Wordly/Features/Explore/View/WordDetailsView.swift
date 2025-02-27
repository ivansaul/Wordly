//
//  WordDetailsView.swift
//  Wordly
//
//  Created by @ivansaul on 2/23/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct WordDetailsView: View {
    let word: Word

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                PhoneticRowView(name: "us", value: word.transcription.us, audio: word.sound.us)

                PhoneticRowView(name: "uk", value: word.transcription.uk, audio: word.sound.uk)

                MeaningsView(meanings: word.meaning.value)

                if let examples = word.examples {
                    ExamplesView(examples: examples)
                }
            }
            .padding()
        }
        .backgroundApp()
        .navigationTitle(word.value.capitalized)
    }
}

#Preview {
    NavigationStack {
        WordDetailsView(word: .mock)
    }
}
