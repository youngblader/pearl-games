//
//  Game.swift
//  PearlGames
//
//  Created by Евгений Зорич on 27.10.23.
//

import Foundation


//MARK: - GamesPreviewData
struct GamesPreviewData {
    let new: [Game]
    let comingSoon: [Game]
    let newReleased: [Game]
    let popularGames: [Game]
}

// MARK: - Game
struct Game: Codable {
    let slug, name: String
    let playtime: Int
    let platforms: [Platform]
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
    let parentPlatforms: [Platform]
    let genres: [Genre]

    enum CodingKeys: String, CodingKey {
        case slug, name, playtime, platforms, stores, released, tba
        case backgroundImage = "background_image"
        case rating
        case ratingTop = "rating_top"
        case ratings
        case ratingsCount = "ratings_count"
        case reviewsTextCount = "reviews_text_count"
        case added
        case addedByStatus = "added_by_status"
        case metacritic
        case suggestionsCount = "suggestions_count"
        case updated, id, score, clip, tags
        case esrbRating = "esrb_rating"
        case userGame = "user_game"
        case reviewsCount = "reviews_count"
        case saturatedColor = "saturated_color"
        case dominantColor = "dominant_color"
        case shortScreenshots = "short_screenshots"
        case parentPlatforms = "parent_platforms"
        case genres
    }
}

// MARK: - AddedByStatus
struct AddedByStatus: Codable {
    let yet, owned, beaten, toplay: Int?
    let dropped, playing: Int?
}

//enum Color: String, Codable {
//    case string
//}

// MARK: - EsrbRating
struct EsrbRating: Codable {
    let id: Int
    let name, slug, nameEn, nameRu: String

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case nameEn = "name_en"
        case nameRu = "name_ru"
    }
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

    enum CodingKeys: String, CodingKey {
        case id, name, slug, language
        case gamesCount = "games_count"
        case imageBackground = "image_background"
    }
}

// MARK: - Language
enum Language: String, Codable {
    case eng = "eng"
    case rus = "rus"
}
