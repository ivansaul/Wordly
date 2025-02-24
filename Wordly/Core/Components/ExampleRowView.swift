//
//  ExampleRowView.swift
//  Wordly
//
//  Created by @ivansaul on 2/23/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct ExampleRowView: View {
    @State private var showTranslation: Bool = false

    let example: Example

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(example.en)
                    .font(.subheadline)

                if showTranslation {
                    Text(example.es)
                        .foregroundStyle(Color(uiColor: .systemGray))
                        .font(.subheadline)
                }
            }
            .onTapGesture {
                withAnimation(.spring) {
                    showTranslation.toggle()
                }
            }

            Spacer()

            Button(action: {
                withAnimation(.spring) {
                    showTranslation.toggle()
                }
            }, label: {
                Image(systemName: showTranslation ? "chevron.up.circle" : "chevron.down.circle")
                    .animation(.spring)
            })
        }
    }
}

#Preview {
    ZStack {
        ExampleRowView(example: .mock)
    }.backgroundApp()
}
