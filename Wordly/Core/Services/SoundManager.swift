//
//  SoundManager.swift
//  Wordly
//
//  Created by @ivansaul on 2/24/25.
//
//  https://github.com/ivansaul
//

import AVFoundation
import Foundation

final class SoundManager {
    private var player: AVPlayer?

    func playSound(url: String) {
        guard let url = URL(string: url) else { return }
        player = AVPlayer(url: url)
        player?.play()
    }
}
