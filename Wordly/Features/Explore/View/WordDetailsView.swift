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
    @State private var picker: PickerItem = .translations

    let word: Word

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                phoneticsView()

                MeaningsView(meanings: self.word.meaning.value)

                Picker("", selection: self.$picker) {
                    ForEach(pickerItems, id: \.self) {
                        Text($0.rawValue.capitalized)
                            .tag($0)
                    }
                }
                .pickerStyle(.segmented)

                pickerContentView()
            }
            .padding()
        }
        .backgroundApp()
        .navigationTitle(self.word.value.capitalized)
        .task(id: self.word.id) {
            Task { self.picker = pickerItems[0] }
        }
    }
}

#Preview {
    NavigationStack {
        WordDetailsView(word: .mock)
    }
}

extension WordDetailsView {
    private enum PickerItem: String, CaseIterable {
        case translations
        case definitions
        case examples
    }

    private var pickerItems: [PickerItem] {
        return PickerItem.allCases.filter { item in
            (item != .translations || self.word.translations.count != 0) &&
                (item != .definitions || self.word.definitions.count != 0) &&
                (item != .examples || self.word.examples != nil)
        }
    }

    @ViewBuilder
    private func phoneticsView() -> some View {
        PhoneticRowView(
            name: "us",
            value: self.word.transcription.us,
            audio: self.word.sound.us
        )
        PhoneticRowView(
            name: "uk",
            value: self.word.transcription.uk,
            audio: self.word.sound.uk
        )
    }

    @ViewBuilder
    private func pickerContentView() -> some View {
        if self.picker == .translations, self.word.translations.count > 0 {
            TranslationsView(translations: self.word.translations)
        }

        if self.picker == .definitions, self.word.definitions.count > 0 {
            DefinitionsView(definitions: self.word.definitions)
        }

        if self.picker == .examples, let examples = word.examples {
            ExamplesView(examples: examples)
        }
    }
}
