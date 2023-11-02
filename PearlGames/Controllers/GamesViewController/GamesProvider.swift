//
//  GamesProvider.swift
//  PearlGames
//
//  Created by Евгений Зорич on 18.10.23.
//

import Foundation

protocol GamesProvider {
    var router: Router { get }
    var gameService: GameService { get set }
}

final class GamesProviderImpl: GamesProvider {
    var gameService: GameService
    var router: Router
    
    //MARK: Dependencies
    init(gameService: GameService, router: Router) {
        self.gameService = gameService
        self.router = router
    }
}
