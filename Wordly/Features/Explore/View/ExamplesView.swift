//
//  ExamplesView.swift
//  Wordly
//
//  Created by @ivansaul on 2/23/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct ExamplesView: View {
    @State private var showTranslation: Bool = false

    let examples: [Example]

    var body: some View {
        SectionContainer(title: "Examples") {
            VStack {
                ForEach(examples, id: \.self) { example in
                    ExampleRowView(example: example)
                        .padding(.top, 5)
                    Divider()
                }
            }
        }
    }
}

#Preview {
    ZStack {
        ExamplesView(examples: .mock)
    }.backgroundApp()
}
