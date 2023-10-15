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
}

final class ScreenFactoryImpl: ScreenFactory {
    weak var di: Di!
    
    func createTabBar() -> TabBarController {
        return TabBarController()
    }
    
    func createGamesController() -> GamesViewController {
        return GamesViewController()
    }
    
    func createSearchGamesController() -> SearchGamesViewController {
        return SearchGamesViewController()
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
}
