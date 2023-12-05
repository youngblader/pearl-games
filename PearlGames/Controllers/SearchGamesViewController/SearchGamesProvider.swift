//
//  SearchGamesProvider.swift
//  PearlGames
//
//  Created by Евгений Зорич on 31.10.23.
//

import Foundation

protocol SearchGamesProvider {
    var router: Router { get }
    var gameService: GameService { get set }
}

final class SearchGamesProviderImpl: SearchGamesProvider {
    var gameService: GameService
    var router: Router
    
    //MARK: Dependencies
    init(gameService: GameService, router: Router) {
        self.gameService = gameService
        self.router = router
    }
}
