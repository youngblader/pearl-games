//
//  Game.swift
//  PearlGames
//
//  Created by Евгений Зорич on 27.10.23.
//

import Foundation

// MARK: - Game
struct Game: Codable {
    let slug, name: String
    let playtime: Int
    let platforms: [Platform]?
    let stores: [Store]?
    let released: String?
    let tba: Bool
    let backgroundImage: String?
    let rating: Double
    let ratingTop: Int
    let ratings: [Rating]
    let ratingsCount, reviewsTextCount, added: Int
    let addedByStatus: AddedByStatus?
    let metacritic: Int?
    let suggestionsCount: Int
    let updated: String
    let id: Int
    let score, clip: String?
    let tags: [Tag]?
    let esrbRating: EsrbRating?
    let userGame: String?
    let reviewsCount: Int
    let saturatedColor, dominantColor: String //Color
    let shortScreenshots: [ShortScreenshot]?
    let parentPlatforms: [Platform]?
    let genres: [Genre]
}

// MARK: - AddedByStatus
struct AddedByStatus: Codable {
    let yet, owned, beaten, toplay: Int?
    let dropped, playing: Int?
}

// MARK: - EsrbRating
struct EsrbRating: Codable {
    let id: Int
    let name, slug: String
    let nameEn, nameRu: String?
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name, slug: String
}

// MARK: - Platform
struct Platform: Codable {
    let platform: Genre
}

// MARK: - Rating
struct Rating: Codable {
    let id: Int
    let title: Title
    let count: Int
    let percent: Double
}

enum Title: String, Codable {
    case exceptional = "exceptional"
    case meh = "meh"
    case recommended = "recommended"
    case skip = "skip"
}

// MARK: - ShortScreenshot
struct ShortScreenshot: Codable {
    let id: Int
    let image: String
}

// MARK: - Store
struct Store: Codable {
    let store: Genre
}

// MARK: - Tag
struct Tag: Codable {
    let id: Int
    let name, slug: String
    let language: Language
    let gamesCount: Int
    let imageBackground: String?
}

// MARK: - Language
enum Language: String, Codable {
    case eng = "eng"
    case rus = "rus"
}
