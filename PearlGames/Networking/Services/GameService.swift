//
//  GameService.swift
//  PearlGames
//
//  Created by Евгений Зорич on 30.10.23.
//

import Foundation

protocol GameService {
    func fetchCoomingGames(page: Int, size: Int) async throws -> [Game]
    func fetchNewReleasedGames(page: Int, size: Int) async throws -> [Game]
    func fetchPopularGames(page: Int, size: Int) async throws -> [Game]
    func fetchPreviewGames() async throws -> [Game]
    func fetchSearchGames(_ value: String) async throws -> [Game]
    func fetchGameDetails(_ id: Int) async throws -> GameDetails
    func fetchCategoryGames(_ category: GameCategory) async throws -> [Game]
}

final class GameServiceImpl: GameService, API {
    func fetchPreviewGames() async throws -> [Game] {
        return []
    }
    
    func fetchCoomingGames(page: Int, size: Int) async throws -> [Game] {
        return try await request(endpoint: GamesEndpoint.getCoomingGames(page: page, size: size), responseModel: GamesResponse.self).results
    }
    
    func fetchNewReleasedGames(page: Int, size: Int) async throws -> [Game] {
        return try await request(endpoint: GamesEndpoint.getNewReleasedGames(page: page, size: size), responseModel: GamesResponse.self).results
    }
    
    func fetchPopularGames(page: Int, size: Int) async throws -> [Game] {
        return try await request(endpoint: GamesEndpoint.getPopularGames(page: page, size: size), responseModel: GamesResponse.self).results
    }
    
    func fetchSearchGames(_ value: String) async throws -> [Game] {
        return try await request(endpoint: GamesEndpoint.getSearchGames(searchText: value), responseModel: GamesResponse.self).results
    }
    
    func fetchGameDetails(_ id: Int) async throws -> GameDetails {
        return try await request(endpoint: GamesEndpoint.getGameDetails(gameId: id), responseModel: GameDetails.self)
    }
    
    func fetchCategoryGames(_ category: GameCategory) async throws -> [Game] {
        let gamesCategory = GamesCategory(rawValue: category.index)
        
        switch gamesCategory {
        case .new:
            return []
        case .comingSoon:
            return try await fetchCoomingGames(page: 1, size: 20)
        case .newReleases:
            return try await fetchNewReleasedGames(page: 1, size: 20)
        case .popularGames:
            return try await fetchPopularGames(page: 1, size: 20)
        default:
            return []
        }
    }
}
