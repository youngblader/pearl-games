//
//  GamesEndpoint.swift
//  PearlGames
//
//  Created by Евгений Зорич on 30.10.23.
//

import Foundation

enum GamesEndpoint {
    case getCoomingGames(page: Int, size: Int)
    case getNewReleasedGames(page: Int, size: Int)
    case getPopularGames(page: Int, size: Int)
    case getSearchGames(searchText: String)
    case getGameDetails(gameId: Int)
}

extension GamesEndpoint: Endpoint {
    var method: NetworkMethod {
        switch self {
        case .getCoomingGames, .getNewReleasedGames, .getPopularGames, .getSearchGames, .getGameDetails:
            return .get
        }
    }
    
    var body: [String: String]? {
        switch self {
        case .getCoomingGames, .getNewReleasedGames, .getPopularGames, .getSearchGames, .getGameDetails:
            return nil
        }
    }
    
    //yy.mm.dd
    var parameters: [URLQueryItem] {
        switch self {
        case .getCoomingGames(let page, let size):
            return [URLQueryItem(name: "dates", value: "2023-11-21,2024-12-21"),
                    URLQueryItem(name: "ordering", value: "-added"),
                    URLQueryItem(name: "page", value: "\(page)"),
                    URLQueryItem(name: "page_size", value: "\(size)")]
        case .getNewReleasedGames(let page, let size):
            return [URLQueryItem(name: "dates", value: "2022-10-10,2023-11-21"),
                    URLQueryItem(name: "ordering", value: "-released"),
                    URLQueryItem(name: "page", value: "\(page)"),
                    URLQueryItem(name: "page_size", value: "\(size)"),
                    URLQueryItem(name: "metacritic", value: "65,100")]
        case .getPopularGames(let page, let size): //2019-01-01,2019-12-31
            return [URLQueryItem(name: "dates", value: "2023-01-01,2023-12-31"),
                    URLQueryItem(name: "ordering", value: "-added"),
                    URLQueryItem(name: "page", value: "\(page)"),
                    URLQueryItem(name: "page_size", value: "\(size)"),
                    URLQueryItem(name: "metacritic", value: "65,100")]
        case .getSearchGames(let searchText):
            return [URLQueryItem(name: "search", value: "\(searchText)"),
                    URLQueryItem(name: "search_exact", value: "true")]
        case .getGameDetails:
            return []
        }
    }
    
    var headers: [String: String]? {
        let accessToken = ""
        switch self {
        case .getCoomingGames, .getNewReleasedGames, .getPopularGames, .getSearchGames, .getGameDetails:
            return [
                "Authorization": "Bearer \(accessToken)",
                "Content-Type": "application/json;charset=utf-8"
            ]
        }
    }
    
    var path: String {
        switch self {
        case .getCoomingGames, .getNewReleasedGames, .getPopularGames, .getSearchGames:
            return "/api/games"
        case .getGameDetails(let id):
            return "/api/games/\(id)"
        }
    }
}
