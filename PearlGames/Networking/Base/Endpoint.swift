//
//  Endpoint.swift
//  PearlGames
//
//  Created by Евгений Зорич on 30.10.23.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: NetworkMethod { get }
    var parameters: [URLQueryItem] { get }
    var headers: [String: String]? { get }
    var body: [String: String]? { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "api.rawg.io"
    }
    
    //    var path: String {
    //        return "/api/rest"
    //    }
}
