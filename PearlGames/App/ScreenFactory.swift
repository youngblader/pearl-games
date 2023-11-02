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
    func createGameDetailsController() -> GameDetailsViewController
    func createGamesCategoryController() -> GamesCategoryViewController
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
        return SettingsViewController(provider: Di.shared.settingsProvider)
    }
    
    func createWishlistController() -> WishlistViewController {
        return WishlistViewController()
    }
    
    func createAppearanceController() -> AppearanceViewController {
        return AppearanceViewController()
    }
    
    func createGameDetailsController() -> GameDetailsViewController {
        return GameDetailsViewController()
    }
    
    func createGamesCategoryController() -> GamesCategoryViewController {
        return GamesCategoryViewController()
    }
}
