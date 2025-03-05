//
//  PhoneticRowView.swift
//  Wordly
//
//  Created by @ivansaul on 2/23/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct PhoneticRowView: View {
    let name: String
    let value: String
    let audio: String

    var body: some View {
        HStack {
            Text(name)
                .foregroundStyle(.white)
                .font(.subheadline)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color(uiColor: .systemBlue))
                .clipShape(RoundedRectangle(cornerRadius: 8))

            Text("[\(value)]")

            SoundButtonView(url: audio)
        }
    }
}

#Preview {
    VStack {
        PhoneticRowView(
            name: "us",
            value: Word.mock.transcription.us,
            audio: Word.mock.sound.us
        )
        PhoneticRowView(
            name: "uk",
            value: Word.mock.transcription.uk,
            audio: Word.mock.sound.uk
        )
    }
    .backgroundApp()
}
