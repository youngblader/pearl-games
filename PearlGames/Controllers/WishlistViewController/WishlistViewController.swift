//
//  WishlistViewController.swift
//  PearlGames
//
//  Created by Евгений Зорич on 7.10.23.
//

import UIKit

final class WishlistViewController: UIViewController {
    // LoadView
    private var wishlistView: WishlistView {
        return self.view as! WishlistView
    }
    
    override func loadView() {
        self.view = WishlistView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

extension WishlistViewController {
    private func setup() {
        self.title = "Wishlist"
        
        self.navigationItem.searchController = wishlistView.searchController

        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
