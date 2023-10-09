//
//  Router.swift
//  PearlGames
//
//  Created by Евгений Зорич on 7.10.23.
//

import UIKit

protocol Router {
    var di: Di! { get set }
    
//    func navigateToGame(_ product: Product, _ from: UIViewController)
//    func navigateToDetailBenefit(_ benefit: Benefit, _ from: UIViewController)
//    func navigateToSearchProducts(_ products: [Product], _ from: UIViewController)
    func dismiss(_ from: UIViewController)
}

final class RouterImpl: Router {
    weak var di: Di!
    
//    func navigateToDetailProduct(_ product: Product, _ from: UIViewController) {
//        let controller = di.screenFactory.createDetailProductVC(product)
//
//        from.present(controller, animated: true)
//    }
//
//    func navigateToDetailBenefit(_ benefit: Benefit, _ from: UIViewController) {
//        let controller = di.screenFactory.createDetailBenefitVC(benefit)
//
//        from.present(controller, animated: true)
//    }
//
//    func navigateToSearchProducts(_ products: [Product], _ from: UIViewController) {
//        let controller = di.screenFactory.createSearchProductsVC(products)
//        controller.modalPresentationStyle = .custom
//
//        from.present(controller, animated: true)
//    }
    
    func dismiss(_ from: UIViewController) {
        from.dismiss(animated: true, completion: nil)
    }
}
