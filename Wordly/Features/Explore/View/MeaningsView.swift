//
//  MeaningsView.swift
//  Wordly
//
//  Created by @ivansaul on 2/23/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct MeaningsView: View {
    let meanings: [String]

    private var meaningsString: String {
        meanings.joined(separator: ", ")
    }

    var body: some View {
        SectionContainer(title: "Meanings") {
            Text(meaningsString)
                .font(.subheadline)
        }
    }
}

#Preview {
    ZStack {
        MeaningsView(meanings: Word.mock.meanings)
    }
    .backgroundApp()
}
