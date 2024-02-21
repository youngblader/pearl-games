//
//  GameDetails.swift
//  PearlGames
//
//  Created by Евгений Зорич on 3.11.23.
//

import Foundation

// MARK: - GameDetails
struct GameDetails: Codable {
    let id: Int
    let slug, name, nameOriginal, description: String
    let metacritic: Int?
    let metacriticPlatforms: [MetacriticPlatform]
    let released: String?
    let tba: Bool
    let updated: String
    let backgroundImage, backgroundImageAdditional: String
    let website: String
    let rating: Double
    let ratingTop: Int
    let ratings: [DetailGameRating]
    let reactions: [String: Int]?
    let added: Int
    let addedByStatus: DetailGameAddedByStatus?
    let playtime, screenshotsCount, moviesCount, creatorsCount: Int
    let achievementsCount, parentAchievementsCount: Int
    let redditURL: URL?
    let redditName, redditDescription, redditLogo: String
    let redditCount, twitchCount, youtubeCount, reviewsTextCount: Int
    let ratingsCount, suggestionsCount: Int
    let alternativeNames: [String]
    let metacriticURL: URL?
    let parentsCount, additionsCount, gameSeriesCount: Int
    let userGame: String?
    let reviewsCount: Int
    let saturatedColor, dominantColor: String
    let parentPlatforms: [ParentPlatform]?
    let platforms: [PlatformElement]?
    let stores: [DetailGameStores]
    let developers, genres, tags, publishers: [Developer]
    let esrbRating: DetailGameEsrbRating?
    let clip: String?
    let descriptionRaw: String
}

// MARK: - DetailGameAddedByStatus
struct DetailGameAddedByStatus: Codable {
    let yet, owned, toplay: Int
    let dropped, playing: Int?
    let beaten: Int?
}

// MARK: - Developer
struct Developer: Codable {
    let id: Int
    let name, slug: String
    let gamesCount: Int
    let imageBackground: String
    let domain: String?
    let language: String?
}

// MARK: - DetailGameEsrbRating
struct DetailGameEsrbRating: Codable {
    let id: Int
    let name, slug: String
}

// MARK: - MetacriticPlatform
struct MetacriticPlatform: Codable {
    let metascore: Int
    let url: String
    let platform: MetacriticPlatformPlatform
}

// MARK: - MetacriticPlatformPlatform
struct MetacriticPlatformPlatform: Codable {
    let platform: Int
    let name, slug: String
}

// MARK: - ParentPlatform
struct ParentPlatform: Codable {
    let platform: DetailGameEsrbRating
}

// MARK: - PlatformElement
struct PlatformElement: Codable {
    let platform: PlatformPlatform
    let releasedAt: String?
    let requirements: Requirements
}

// MARK: - PlatformPlatform
struct PlatformPlatform: Codable {
    let id: Int
    let name, slug: String
    let image, yearEnd: String?
    let yearStart: Int?
    let gamesCount: Int
    let imageBackground: String
}

// MARK: - Requirements
struct Requirements: Codable {
    let minimum, recommended: String?
}

// MARK: - Rating
struct DetailGameRating: Codable {
    let id: Int
    let title: String
    let count: Int
    let percent: Double
}

// MARK: - Stores
struct DetailGameStores: Codable {
    let id: Int
    let url: String
    let store: DetailsGameStore
}

// MARK: - DetailsGameStore
struct DetailsGameStore: Codable {
    let id: Int
    let name, slug: String
    let gamesCount: Int
    let imageBackground: String
    let domain: String?
}
