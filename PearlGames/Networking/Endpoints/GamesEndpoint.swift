//
//  GamesEndpoint.swift
//  PearlGames
//
//  Created by Евгений Зорич on 30.10.23.
//

import Foundation

enum GamesEndpoint {
    case getWhatsNewGames
    case getCoomingGames
    case getNewReleasedGames
    case getPopularGames
    case getSearchGames(String)
}

extension GamesEndpoint: Endpoint {
    var method: NetworkMethod {
        switch self {
        case .getWhatsNewGames, .getCoomingGames, .getNewReleasedGames, .getPopularGames, .getSearchGames:
            return .get
        }
    }
    
    var body: [String: String]? {
        switch self {
        case .getWhatsNewGames, .getCoomingGames, .getNewReleasedGames, .getPopularGames, .getSearchGames:
            return nil
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .getCoomingGames:
            return [URLQueryItem(name: "dates", value: "2022-10-10,2023-10-10"),
                    URLQueryItem(name: "ordering", value: "-added"),
                    URLQueryItem(name: "metacritic", value: "65,100")]
        case .getWhatsNewGames:
            return [URLQueryItem(name: "dates", value: "2022-10-10,2023-10-10"),
                    URLQueryItem(name: "ordering", value: "-added"),
                    URLQueryItem(name: "metacritic", value: "65,100")]
        case .getNewReleasedGames:
            return [URLQueryItem(name: "dates", value: "2022-10-10,2023-10-10"),
                    URLQueryItem(name: "ordering", value: "-released"),
                    URLQueryItem(name: "metacritic", value: "65,100")]
        case .getPopularGames:
            return [URLQueryItem(name: "dates", value: "2022-10-10,2023-10-10"),
                    URLQueryItem(name: "ordering", value: "-rating"),
                    URLQueryItem(name: "metacritic", value: "65,100")]
        case .getSearchGames(let searchText):
            return [URLQueryItem(name: "search", value: "\(searchText)"),
//                    URLQueryItem(name: "search_precise", value: false),
                    URLQueryItem(name: "search_exact", value: "true")]
        }
    }
    
    var headers: [String: String]? {
        let accessToken = ""
        switch self {
        case .getWhatsNewGames, .getCoomingGames, .getNewReleasedGames, .getPopularGames, .getSearchGames:
            return [
                "Authorization": "Bearer \(accessToken)",
                "Content-Type": "application/json;charset=utf-8"
            ]
        }
    }
    
    var path: String {
        switch self {
        case .getWhatsNewGames, .getCoomingGames, .getNewReleasedGames, .getPopularGames, .getSearchGames:
            return "/api/games"
        }
    }
}
