//
//  IrregularVerbsView.swift
//  Wordly
//
//  Created by @ivansaul on 3/3/25.
//
//  https://github.com/ivansaul
//

import Factory
import SwiftUI

struct IrregularVerbsView: View {
    @Injected(\.verbsViewModel) private var verbsVM

    var body: some View {
        @Bindable var vm = verbsVM
        ScrollView {
            LazyVStack {
                ForEach(verbsVM.filteredVerbs, id: \.self) { verb in
                    VerbConjugationView(entry: verb)
                }
            }
            .padding(.horizontal)
        }
        .backgroundApp()
        .navigationTitle("Irregular Verbs")
        .searchable(text: $vm.searchText)
        .autocorrectionDisabled()
        .textInputAutocapitalization(.never)
        .animation(.spring, value: verbsVM.filteredVerbs)
        .alert("Error", isPresented: $vm.showAlert) {
            Button("Close", role: .cancel) {}
        } message: {
            Text(verbsVM.errorMessage)
        }
    }
}

#Preview {
    NavigationStack {
        IrregularVerbsView()
    }
}
