//
//  TabBarController.swift
//  PearlGames
//
//  Created by Евгений Зорич on 7.10.23.
//

import UIKit

private struct NavigationController {
    var image: String
    var title: String
    var screen: UIViewController
}

fileprivate let screenFactory = Di.shared.screenFactory

private var controllers: [NavigationController] = [
    NavigationController(image: "gamecontroller.fill", title: "Games", screen: screenFactory.createGamesController()),
    NavigationController(image: "magnifyingglass", title: "Explore", screen: screenFactory.createSearchGamesController()),
    NavigationController(image: "bookmark.fill", title: "Wishlist", screen: screenFactory.createWishlistController()),
    NavigationController(image: "gear", title: "Settings", screen: screenFactory.createSettingsController())
]

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
}

extension TabBarController {
    private func setupTabBar() {
        var navigationControllers: [UINavigationController] = []
        
        for controller in controllers {
            let navigationController = setupUINavigationController(controller)
            
            navigationControllers.append(navigationController)
        }
        
        tabBar.tintColor = .white
        viewControllers = navigationControllers
    }
    
    private func setupUINavigationController(_ controller: NavigationController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: controller.screen)
        
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Poppins-SemiBold", size: 16)!]
        
        let image = UIImage(systemName: controller.image)
        let tabItem = UITabBarItem(title: controller.title, image: image, selectedImage: nil)
        
        navigationController.tabBarItem = tabItem
        
        return navigationController
    }
}
