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
    let next: String
    let previous: String?
    let results: [Game]
    let userPlatforms: Bool

    enum CodingKeys: String, CodingKey {
        case count, next, previous, results
        case userPlatforms = "user_platforms"
    }
}
