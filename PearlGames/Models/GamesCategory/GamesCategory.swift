//
//  GamesCategory.swift
//  PearlGames
//
//  Created by Евгений Зорич on 3.11.23.
//

import Foundation

enum GamesCategory: Int, CaseIterable {
    case comingSoon, popularGames, newReleases
    
    var title: String {
        switch self {
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
