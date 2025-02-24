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
                PhoneticRowView(name: "us", value: word.ipa.us, audio: word.audio.us)

                PhoneticRowView(name: "uk", value: word.ipa.uk, audio: word.audio.uk)

                MeaningsView(meanings: word.meanings)

                ExamplesView(examples: word.examples)
            }
            .padding()
        }
        .backgroundApp()
        .navigationTitle(word.word.capitalized)
    }
}

#Preview {
    NavigationStack {
        WordDetailsView(word: .mock)
    }
}
