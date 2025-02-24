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
    let title: String

    @ViewBuilder let content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.subheadline)
                .foregroundStyle(Color(uiColor: .systemGray))

            content()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .roundedBackground()
    }
}

#Preview {
    ZStack {
        SectionContainer(title: "Meanings") {
            Text(Word.mock.meanings.joined(separator: ", "))
        }
    }.backgroundApp()
}
