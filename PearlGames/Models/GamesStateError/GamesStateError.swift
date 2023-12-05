//
//  GamesStateError.swift
//  PearlGames
//
//  Created by Евгений Зорич on 2.11.23.
//

import Foundation

enum GamesStateError: String {
    case failed = "Failed to load content."
    case noResults = "There were no results. Try a new search."
    case noData = "No games found."
}
