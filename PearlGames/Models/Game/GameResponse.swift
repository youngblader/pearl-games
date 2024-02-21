//
//  GameResponse.swift
//  PearlGames
//
//  Created by Евгений Зорич on 27.10.23.
//

import Foundation

// MARK: - GamesResponse
struct GamesResponse: Codable {
    let count: Int
    let next: URL?
    let previous: URL?
    let results: [Game]
    let userPlatforms: Bool?
}
