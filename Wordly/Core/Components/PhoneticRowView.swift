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
                .font(.headline)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 8))

            Text("[\(value)]")

            Button(action: {
                // TODO: implement audio manager
            }, label: {
                Image(systemName: "waveform")
                    .foregroundStyle(.blue)
                    .padding(.horizontal)
            })
        }
    }
}

#Preview {
    VStack {
        PhoneticRowView(name: "us", value: Word.mock.ipa.us, audio: Word.mock.audio.us)
        PhoneticRowView(name: "uk", value: Word.mock.ipa.uk, audio: Word.mock.audio.uk)
    }
    .backgroundApp()
}
