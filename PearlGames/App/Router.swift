//
//  Router.swift
//  PearlGames
//
//  Created by Евгений Зорич on 7.10.23.
//

import UIKit

protocol Router {
    var di: Di! { get set }
    
    func navigateToAppearanceController(_ from: UIViewController)
    func navigateToGamesCategoryController(_ from: UIViewController)
    func navigateToGameDetailsController(_ gameId: Int, _ from: UIViewController)
    func dismiss(_ from: UIViewController)
}

final class RouterImpl: Router {
    weak var di: Di!
    
    func navigateToGamesCategoryController(_ from: UIViewController) {
        let vc = di.screenFactory.createGamesCategoryController()
        
        from.navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateToGameDetailsController(_ gameId: Int, _ from: UIViewController) {
        let vc = di.screenFactory.createGameDetailsController()
        vc.gameId = gameId
        
        from.navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateToAppearanceController(_ from: UIViewController) {
        let vc = di.screenFactory.createAppearanceController()
        
        from.navigationController?.pushViewController(vc, animated: true)
    }
    
    func dismiss(_ from: UIViewController) {
        from.dismiss(animated: true, completion: nil)
    }
}
