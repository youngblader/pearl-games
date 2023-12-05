//
//  WishlistProvider.swift
//  PearlGames
//
//  Created by Евгений Зорич on 16.11.23.
//

import Foundation

protocol WishlistProvider {
    var router: Router { get }
    var gameService: GameService { get set }
    var wishlistArchiver: WishlistArchiver { get set }
}

final class WishlistProviderImpl: WishlistProvider {
    var gameService: GameService
    var router: Router
    var wishlistArchiver: WishlistArchiver
    
    //MARK: Dependencies
    init(gameService: GameService, wishlistArchiver: WishlistArchiver, router: Router) {
        self.gameService = gameService
        self.wishlistArchiver = wishlistArchiver
        self.router = router
    }
}
