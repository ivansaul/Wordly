//
//  String.swift
//  Wordly
//
//  Created by @ivansaul on 2/26/25.
//
//  https://github.com/ivansaul
//

import Foundation

extension String {
    func htmlToMarkdown() -> String {
        replacingOccurrences(of: "<b>", with: "**")
            .replacingOccurrences(of: "</b>", with: "**")
    }
}
