//
//  ExplorerView.swift
//  Wordly
//
//  Created by @ivansaul on 2/23/25.
//
//  https://github.com/ivansaul
//

import Factory
import SwiftUI

struct ExplorerView: View {
    @Injected(\.explorerViewModel) private var explorerVM

    var body: some View {
        @Bindable var vm = explorerVM
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(self.explorerVM.filteredWords) { word in
                    NavigationLink(value: word) {
                        WordRowView(word: word)
                            .tint(.primary)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Wordly")
        .searchable(text: $vm.searchText)
        .autocorrectionDisabled()
        .textInputAutocapitalization(.never)
        .backgroundApp()
        .animation(.spring, value: explorerVM.filteredWords)
        .navigationDestination(for: Word.self) { word in
            WordDetailsView(word: word)
        }
        .alert("Error", isPresented: $vm.showAlert) {
            Button("Close", role: .cancel) {}
        } message: {
            Text(explorerVM.errorMessage)
        }
    }
}

#Preview {
    NavigationStack {
        ExplorerView()
    }
}
