//
//  DefinitionsView.swift
//  Wordly
//
//  Created by @ivansaul on 2/27/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct DefinitionsView: View {
    let definitions: [Definition]

    var body: some View {
        groupedView()
    }

    @ViewBuilder
    private func groupedView() -> some View {
        let groupedDefinitions = Dictionary(grouping: definitions, by: \.pos)

        SectionContainer {
            VStack(alignment: .leading) {
                ForEach(Array(groupedDefinitions), id: \.key) { pos, items in
                    VStack(alignment: .leading, spacing: 5) {
                        Text(pos.rawValue)
                            .font(.subheadline)
                            .foregroundStyle(.blue)

                        ForEach(items, id: \.self) { item in
                            VStack(alignment: .leading) {
                                Text(item.value)
                                if let example = item.example {
                                    ExampleRowView(example: example)
                                        .italic()
                                        .foregroundStyle(Color(uiColor: .systemGray))
                                }
                            }
                            .padding(.bottom, 5)
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
        DefinitionsView(definitions: Word.mock.definitions)
    }.backgroundApp()
}
