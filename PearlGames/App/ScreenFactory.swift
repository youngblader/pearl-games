//
//  ScreenFactoryImpl.swift
//  PearlGames
//
//  Created by Евгений Зорич on 7.10.23.
//

import Foundation
import UIKit

protocol ScreenFactory {
    var di: Di! { get set }
    
    func createTabBar() -> TabBarController
    func createGamesController() -> GamesViewController
    func createSearchGamesController() -> SearchGamesViewController
    func createSettingsController() -> SettingsViewController
    func createWishlistController() -> WishlistViewController
    func createAppearanceController() -> AppearanceViewController
    func createGameDetailsController() -> GameDetailsViewController
    func createGamesCategoryController(_ category: GameCategory) -> GamesCategoryViewController
    func createWebViewController(_ url: String) -> WebViewController //UINavigationController
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
    
    func createGameDetailsController() -> GameDetailsViewController {
        return GameDetailsViewController(provider: di.gameDetailsProvider)
    }
    
    func createGamesCategoryController(_ category: GameCategory) -> GamesCategoryViewController {
        return GamesCategoryViewController(provider: di.gamesCategoryProvider, category: category)
    }
    
    func createWebViewController(_ url: String) -> WebViewController {
        let vc = WebViewController(provider: di.webViewProvider)
        
        vc.gameUrl = url
       
        return vc
        //UINavigationController(rootViewController: vc)
    }
}
