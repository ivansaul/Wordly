//
//  WordlyApp.swift
//  Wordly
//
//  Created by @ivansaul on 2/22/25.
//
//  https://github.com/ivansaul
//

import Factory
import SwiftUI

@main
struct WordlyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

extension Container {
    var wordDataService: Factory<WordDataServiceProtocol> {
        self { WordDataService() }
            .singleton
    }

    var verbDataService: Factory<VerbDataServiceProtocol> {
        self { VerbDataService() }
            .singleton
    }

    var explorerViewModel: Factory<ExplorerViewModel> {
        self { ExplorerViewModel(wordDataService: self.wordDataService()) }
            .cached
    }

    var discoverViewModel: Factory<DiscoverViewModel> {
        self { DiscoverViewModel(wordDataService: self.wordDataService()) }
            .cached
    }

    var verbsViewModel: Factory<VerbsViewModel> {
        self { VerbsViewModel(verbDataService: self.verbDataService()) }
            .cached
    }

    var soundManager: Factory<SoundManager> {
        self { SoundManager() }
            .singleton
    }
}
