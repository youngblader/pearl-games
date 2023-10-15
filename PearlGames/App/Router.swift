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
    func dismiss(_ from: UIViewController)
}

final class RouterImpl: Router {
    weak var di: Di!
    
    func navigateToAppearanceController(_ from: UIViewController) {
        let controller = di.screenFactory.createAppearanceController()
        
        from.navigationController?.pushViewController(controller, animated: true)
    }
    
    func dismiss(_ from: UIViewController) {
        from.dismiss(animated: true, completion: nil)
    }
}
