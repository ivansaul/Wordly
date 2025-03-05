//
//  SoundButtonView.swift
//  Wordly
//
//  Created by @ivansaul on 3/4/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

import Factory

struct SoundButtonView: View {
    @Injected(\.soundManager) private var soundManager

    let url: String

    var body: some View {
        Button(action: playSound, label: {
            Image(systemName: "waveform")
        })
    }

    private func playSound() {
        soundManager.playSound(url: url)
    }
}

#Preview {
    SoundButtonView(url: Word.mock.sound.us)
}
