//
//  GamesCategoryProvider.swift
//  PearlGames
//
//  Created by Евгений Зорич on 3.11.23.
//

import Foundation

protocol GamesCategoryProvider {
    var router: Router { get }
    var gameService: GameService { get set }
}

final class GamesCategoryProviderImpl: GamesCategoryProvider {
    var gameService: GameService
    var router: Router
    
    //MARK: Dependencies
    init(gameService: GameService, router: Router) {
        self.gameService = gameService
        self.router = router
    }
}
