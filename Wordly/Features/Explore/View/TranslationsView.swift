//
//  TranslationsView.swift
//  Wordly
//
//  Created by @ivansaul on 2/27/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct TranslationsView: View {
    let translations: [Translation]

    var body: some View {
        groupedView()
    }

    @ViewBuilder
    private func groupedView() -> some View {
        let groupedDefinitions = Dictionary(grouping: translations, by: \.pos)

        SectionContainer {
            VStack(alignment: .leading) {
                ForEach(Array(groupedDefinitions), id: \.key) { pos, items in
                    VStack(alignment: .leading, spacing: 5) {
                        Text(pos.rawValue)
                            .font(.subheadline)
                            .foregroundStyle(Color(uiColor: .systemBlue))

                        ForEach(items, id: \.self) { item in
                            VStack(alignment: .leading) {
                                Text(item.value)

                                Text(item.reverseTranslation.joined(separator: ", "))
                                    .font(.subheadline)
                                    .fontWeight(.regular)
                                    .foregroundStyle(Color(uiColor: .systemGray))
                            }
                        }
                    }
                    Divider()
                }
            }
        }
    }
}

#Preview {
    ZStack {
        TranslationsView(translations: Word.mock.translations)
    }.backgroundApp()
}
