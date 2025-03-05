//
//  MainTabView.swift
//  Wordly
//
//  Created by @ivansaul on 2/24/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct MainTabView: View {
    @State private var currentTab: Int = 0

    var body: some View {
        TabView {
            NavigationStack {
                ExplorerView()
            }
            .tabItem { Label("Explore", systemImage: "textformat.size.larger") }
            .tag(0)

            NavigationStack {
                DiscoverView()
            }
            .tabItem { Label("Discover", systemImage: "scope") }
            .tag(1)
        }
    }
}

#Preview {
    MainTabView()
}
