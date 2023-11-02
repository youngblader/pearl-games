//
//  GameService.swift
//  PearlGames
//
//  Created by Евгений Зорич on 30.10.23.
//

import Foundation

protocol GameService {
    func fetchPreviewGames() async throws -> [Game]
    func fetchCoomingGames() async throws -> [Game]
    func fetchNewReleasedGames() async throws -> [Game]
    func fetchPopularGames() async throws -> [Game]
    func fetchSearchGames(_ value: String) async throws -> [Game]
}

final class GameServiceImpl: GameService, API {
    func fetchPreviewGames() async throws -> [Game] {
        return []
    }
    
    func fetchCoomingGames() async throws -> [Game] {
        return try await request(endpoint: GamesEndpoint.getCoomingGames, responseModel: GamesResponse.self).results
    }
    
    func fetchNewReleasedGames() async throws -> [Game] {
        return try await request(endpoint: GamesEndpoint.getNewReleasedGames, responseModel: GamesResponse.self).results
    }
    
    func fetchPopularGames() async throws -> [Game] {
        return try await request(endpoint: GamesEndpoint.getPopularGames, responseModel: GamesResponse.self).results
    }
    
    func fetchSearchGames(_ value: String) async throws -> [Game] {
        return try await request(endpoint: GamesEndpoint.getSearchGames(value), responseModel: GamesResponse.self).results
    }
}
