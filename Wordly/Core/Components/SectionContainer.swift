//
//  SectionContainer.swift
//  Wordly
//
//  Created by @ivansaul on 2/23/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct SectionContainer<Content: View>: View {
    let title: String?

    @ViewBuilder let content: () -> Content

    init(title: String? = nil, content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            if let title {
                Text(title)
                    .font(.subheadline)
                    .foregroundStyle(Color(uiColor: .systemGray))
            }

            content()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedBackground()
    }
}

#Preview {
    ZStack {
        VStack {
            SectionContainer(title: "Meanings") {
                Text(Word.mock.meaning.value.joined(separator: ", "))
            }

            SectionContainer {
                Text(Word.mock.meaning.value.joined(separator: ", "))
            }
        }
    }.backgroundApp()
}
