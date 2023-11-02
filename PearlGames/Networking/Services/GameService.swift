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
    
    func fetchGameDetails(_ id: Int) async throws -> [Game] {
        return try await request(endpoint: GamesEndpoint.getGameDetails(gameId: id), responseModel: GamesResponse.self).results // тут скорее другая модель будет
    }
}
