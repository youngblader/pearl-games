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
    func fetchSearchGames(searchText: String) async throws -> [Game]
    func fetchGame(id: Int) async throws -> GameDetails
    func fetchCategoryGames(category: GameCategory) async throws -> [Game]
}

final class GameServiceImpl: GameService, API {
    func fetchCoomingGames(page: Int, size: Int) async throws -> [Game] {
        return try await request(endpoint: GamesEndpoint.getCoomingGames(page: page, size: size), responseModel: GamesResponse.self).results
    }
    
    func fetchNewReleasedGames(page: Int, size: Int) async throws -> [Game] {
        return try await request(endpoint: GamesEndpoint.getNewReleasedGames(page: page, size: size), responseModel: GamesResponse.self).results
    }
    
    func fetchPopularGames(page: Int, size: Int) async throws -> [Game] {
        return try await request(endpoint: GamesEndpoint.getPopularGames(page: page, size: size), responseModel: GamesResponse.self).results
    }
    
    func fetchSearchGames(searchText: String) async throws -> [Game] {
        return try await request(endpoint: GamesEndpoint.getSearchGames(searchText: searchText), responseModel: GamesResponse.self).results
    }
    
    func fetchGame(id: Int) async throws -> GameDetails {
        return try await request(endpoint: GamesEndpoint.getGame(gameId: id), responseModel: GameDetails.self)
    }
    
    func fetchCategoryGames(category: GameCategory) async throws -> [Game] {
        let gamesCategory = GamesCategory(rawValue: category.index)
        
        switch gamesCategory {
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
