//
//  DiscoverView.swift
//  Wordly
//
//  Created by @ivansaul on 2/24/25.
//
//  https://github.com/ivansaul
//

import Factory
import SwiftUI

struct DiscoverView: View {
    @Injected(\.discoverViewModel) private var discoverVM

    var body: some View {
        @Bindable var vm = discoverVM
        WordDetailsView(word: discoverVM.word)
            .alert("Error", isPresented: $vm.showAlert) {
                Button("Close", role: .cancel) {}
            } message: {
                Text(discoverVM.errorMessage)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: fetchRandomWord, label: {
                        Image(systemName: "arrow.2.circlepath")
                    })
                }
            }
    }

    private func fetchRandomWord() {
        Task { await discoverVM.fetchRandomWord() }
    }
}

#Preview {
    NavigationStack {
        DiscoverView()
    }
}
