//
//  VerbConjugationView.swift
//  Wordly
//
//  Created by @ivansaul on 3/4/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct VerbConjugationView: View {
    @State private var isExpanded: Bool = false

    let entry: VerbConjugation

    private let columns = Array(
        repeating: GridItem(.flexible()),
        count: 3
    )

    private var items: [[Verb]] {
        [
            entry.baseForm,
            entry.pastSimple,
            entry.pastParticiple,
        ]
    }

    var body: some View {
        SectionContainer {
            VStack(alignment: .leading) {
                // TODO: Fix weird animation issue when expanding
                LazyVGrid(columns: columns, alignment: .leading, spacing: 0) {
                    ForEach(Array(items.enumerated()), id: \.0) { _, item in
                        VerbFormView(entry: item)
                    }
                }

                if isExpanded {
                    buildDetails
                }
            }
        }
        .overlay(alignment: .topTrailing) {
            expandButton
        }
    }
}

#Preview {
    ZStack {
        VerbConjugationView(entry: VerbConjugation.mock)
    }.backgroundApp()
}

private struct VerbFormView: View {
    let entry: [Verb]

    var body: some View {
        // TODO: Replace with WrappingHStack
        VStack(alignment: .leading) {
            ForEach(entry) { form in
                VStack(alignment: .leading) {
                    HStack {
                        Text(form.value)
                            .font(.headline)

                        SoundButtonView(url: form.sound)
                    }
                    Text("[\(form.transcription)]")
                        .foregroundStyle(Color(uiColor: .systemGray))
                        .font(.callout)
                }
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

extension VerbConjugationView {
    private var buildDetails: some View {
        VStack(alignment: .leading) {
            Text("Meanings:")
                .font(.subheadline)
                .fontWeight(.semibold)

            let meanings = Array(entry.meanings.prefix(10))
            Text(meanings.joined(separator: ", "))
                .font(.callout)

            Divider()

            Text("Definitions:")
                .font(.subheadline)
                .fontWeight(.semibold)

            Text(entry.definitions.joined(separator: "\n"))
                .font(.callout)

            Divider()

            if let notes = entry.notes {
                Text("Notes:")
                    .font(.subheadline)
                    .fontWeight(.semibold)

                Text(.init(notes))
                    .font(.callout)

                Divider()
            }
        }
        .foregroundStyle(Color(uiColor: .systemGray))
    }

    private var expandButton: some View {
        Button(action: toggleDetails, label: {
            Image(systemName: isExpanded
                ? "chevron.up.circle"
                : "chevron.down.circle"
            )
        })
        .padding(.top, 30)
        .padding(.trailing, 10)
        .tint(Color(uiColor: .systemGray2))
    }

    private func toggleDetails() {
        withAnimation(.spring) {
            isExpanded.toggle()
        }
    }
}
