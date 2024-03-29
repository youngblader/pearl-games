//
//  ScreenFactoryImpl.swift
//  PearlGames
//
//  Created by Евгений Зорич on 7.10.23.
//

import Foundation

protocol ScreenFactory {
    var di: Di! { get set }
    
    func createTabBar() -> TabBarController
    func createGamesController() -> GamesViewController
    func createSearchGamesController() -> SearchGamesViewController
    func createSettingsController() -> SettingsViewController
    func createWishlistController() -> WishlistViewController
    func createAppearanceController() -> AppearanceViewController
    func createGameDetailsController(_ gameId: Int) -> GameDetailsViewController
    func createGamesCategoryController(_ category: GameCategory) -> GamesCategoryViewController
    func createWebViewController(_ url: String) -> WebViewController
}

final class ScreenFactoryImpl: ScreenFactory {
    weak var di: Di!
    
    func createTabBar() -> TabBarController {
        return TabBarController()
    }
    
    func createGamesController() -> GamesViewController {
        return GamesViewController(provider: di.gamesProvider)
    }
    
    func createSearchGamesController() -> SearchGamesViewController {
        return SearchGamesViewController(provider: di.searchGamesProvider)
    }
    
    func createSettingsController() -> SettingsViewController {
        return SettingsViewController(provider: di.settingsProvider)
    }
    
    func createWishlistController() -> WishlistViewController {
        return WishlistViewController(provider: di.wishlistProvider)
    }
    
    func createAppearanceController() -> AppearanceViewController {
        return AppearanceViewController()
    }
    
    func createGameDetailsController(_ gameId: Int) -> GameDetailsViewController {
        return GameDetailsViewController(gameId: gameId, provider: di.gameDetailsProvider)
    }
    
    func createGamesCategoryController(_ category: GameCategory) -> GamesCategoryViewController {
        return GamesCategoryViewController(provider: di.gamesCategoryProvider, category: category)
    }
    
    func createWebViewController(_ url: String) -> WebViewController {
        return WebViewController(url: url, provider: di.webViewProvider)
    }
}
