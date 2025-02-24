//
//  WordRowView.swift
//  Wordly
//
//  Created by @ivansaul on 2/23/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct WordRowView: View {
    let word: Word

    private var meanings: String {
        self.word.meanings.joined(separator: ", ")
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text(self.word.word)
                    .font(.headline)

                    + Text(" [\(self.word.ipa.us)]")
                    .foregroundStyle(Color(uiColor: .systemBlue))
                    .font(.callout)

                Text(self.meanings)
                    .font(.subheadline)
                    .foregroundStyle(Color(uiColor: .systemGray))
                    .multilineTextAlignment(.leading)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color(uiColor: .systemGray))
        }
        .padding()
        .roundedBackground()
    }
}

#Preview {
    ZStack {
        WordRowView(word: .mock)
    }.backgroundApp()
}
