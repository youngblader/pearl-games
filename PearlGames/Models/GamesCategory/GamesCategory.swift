//
//  GamesCategory.swift
//  PearlGames
//
//  Created by Евгений Зорич on 3.11.23.
//

import Foundation

enum GamesCategory: Int, CaseIterable {
    case new = 0
    case comingSoon = 1
    case popularGames = 2
    case newReleases = 3
    
    var title: String {
        switch self {
        case .new:
            return "Whats New"
        case .comingSoon:
            return "Cooming Soon"
        case .popularGames:
            return "Popular Games"
        case .newReleases:
            return "New Releases"
        }
    }
}

typealias GameCategory = (title: String, index: Int)
