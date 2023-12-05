//
//  Di.swift
//  PearlGames
//
//  Created by Евгений Зорич on 7.10.23.
//

import UIKit

final class Di {
    static let shared = Di() // neeed?
    
    //MARK: Services
    private let gameService: GameService
    private let wishlistArchiver: WishlistArchiver
    
    private var router: Router
    var screenFactory: ScreenFactory
    
    init() {
        gameService = GameServiceImpl()
        wishlistArchiver = WishlistArchiverImpl()
        router = RouterImpl()
        
        screenFactory = ScreenFactoryImpl()
        screenFactory.di = self
        router.di = self
    }
    
    //MARK: Providers
    var gamesProvider: GamesProviderImpl {
        return GamesProviderImpl(gameService: gameService, router: router)
    }
    
    var settingsProvider: SettingsProviderImpl {
        return SettingsProviderImpl(router: router)
    }
    
    var searchGamesProvider: SearchGamesProviderImpl {
        return SearchGamesProviderImpl(gameService: gameService, router: router)
    }
    
    var gameDetailsProvider: GameDetailsProviderImpl {
        return GameDetailsProviderImpl(gameService: gameService, wishlistArchiver: wishlistArchiver, router: router)
    }
    
    var gamesCategoryProvider: GamesCategoryProviderImpl {
        return GamesCategoryProviderImpl(gameService: gameService, router: router)
    }
    
    var webViewProvider: WebViewProviderImpl {
        return WebViewProviderImpl(router: router)
    }
    
    var wishlistProvider: WishlistProviderImpl {
        return WishlistProviderImpl(gameService: gameService, wishlistArchiver: wishlistArchiver, router: router)
    }
}

extension Di {
    func makeWindowWithController(scene: UIWindowScene) -> UIWindow {
        let window = UIWindow(windowScene: scene)
        
        let rootViewController = screenFactory.createTabBar()
        window.rootViewController = rootViewController
        
        return window
    }
}
