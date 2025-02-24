//
//  View.swift
//  Wordly
//
//  Created by @ivansaul on 2/23/25.
//
//  https://github.com/ivansaul
//

import Foundation
import SwiftUI

extension View {
    func backgroundApp() -> some View {
        ZStack {
            Color(uiColor: .secondarySystemBackground)
                .ignoresSafeArea()

            self
        }
    }

    func roundedBackground() -> some View {
        self
            .background(Color(uiColor: .tertiarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
