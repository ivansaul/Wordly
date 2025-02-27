//
//  PhoneticRowView.swift
//  Wordly
//
//  Created by @ivansaul on 2/23/25.
//
//  https://github.com/ivansaul
//

import Factory
import SwiftUI

struct PhoneticRowView: View {
    @Injected(\.soundManager) private var soundManager

    let name: String
    let value: String
    let audio: String

    var body: some View {
        HStack {
            Text(name)
                .foregroundStyle(.white)
                .font(.headline)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 8))

            Text("[\(value)]")

            Button(action: playSound, label: {
                Image(systemName: "waveform")
                    .foregroundStyle(.blue)
                    .padding(.horizontal)
            })
        }
    }

    private func playSound() {
        soundManager.playSound(url: audio)
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
