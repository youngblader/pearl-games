//
//  GameDetailsProvider.swift
//  PearlGames
//
//  Created by Евгений Зорич on 2.11.23.
//

import Foundation

protocol GameDetailsProvider {
    var router: Router { get }
    var gameService: GameService { get set }
    var wishlistArchiver: WishlistArchiver { get set }
}

final class GameDetailsProviderImpl: GameDetailsProvider {
    var gameService: GameService
    var wishlistArchiver: WishlistArchiver
    var router: Router
    
    //MARK: Dependencies
    init(gameService: GameService, wishlistArchiver: WishlistArchiver, router: Router) {
        self.gameService = gameService
        self.wishlistArchiver = wishlistArchiver
        self.router = router
    }
}
