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
            .tabItem { Label("Explore", systemImage: "scope") }
            .tag(0)

            NavigationStack {
                DiscoverView()
            }
            .tabItem { Label("Discover", systemImage: "clock.arrow.2.circlepath") }
            .tag(1)
        }
    }
}

#Preview {
    MainTabView()
}
