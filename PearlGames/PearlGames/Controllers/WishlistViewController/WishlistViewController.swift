//
//  WishlistViewController.swift
//  PearlGames
//
//  Created by Евгений Зорич on 7.10.23.
//

import UIKit

final class WishlistViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

extension WishlistViewController {
    private func setup() {
        self.title = "Wishlist"
        
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
