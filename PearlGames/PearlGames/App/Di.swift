//
//  Di.swift
//  PearlGames
//
//  Created by Евгений Зорич on 7.10.23.
//

import UIKit

final class Di {
    static let shared = Di()

    //MARK: Services
//    private let cartService: CartService
//    private let menuService: MenuService
//    private let benefitService: BenefitsService
//    private let menuArchiverService: MenuArchiver
    
    private var router: Router
    var screenFactory: ScreenFactory
    
    init() {
//        cartService = CartServiceImpl()
//        menuService = MenuServiceImpl()
//        benefitService = BenefitsServiceImpl()
//        menuArchiverService = MenuArchiverServiceImpl()
        router = RouterImpl()
        
        screenFactory = ScreenFactoryImpl()
        screenFactory.di = self
        router.di = self
    }
    
    //MARK: Providers
//    var menuProvider: MenuProviderImpl {
//        return MenuProviderImpl(menuService: menuService, menuArhiver: menuArchiverService, router: router)
//    }
}

extension Di {
    func makeWindowWithController(scene: UIWindowScene) -> UIWindow {
        let window = UIWindow(windowScene: scene)
        
        let rootViewController = screenFactory.createTabBar()
        window.rootViewController = rootViewController
        
        return window
    }
}
