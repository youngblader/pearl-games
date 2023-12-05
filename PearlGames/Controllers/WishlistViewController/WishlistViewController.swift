//
//  WishlistViewController.swift
//  PearlGames
//
//  Created by Евгений Зорич on 7.10.23.
//

import UIKit

final class WishlistViewController: UIViewController {
    private let wishlistProvider: WishlistProvider
    
    private var wishlistGames: [GameDetails] = []
    private var filtredWishlist: [GameDetails] = []
    
    // searchController properties
    private var searchBarIsEmpty: Bool {
        guard let text = wishlistView.searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return wishlistView.searchController.isActive && !searchBarIsEmpty
    }
    
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
        
        wishlistView.searchController.onSearchGames = { text in
            self.filterWishlistGames(text)
        }
        
        wishlistView.onWishlistGameTapped = { gameId in
            self.presentGameDetailsController(gameId)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let archivedGames = wishlistProvider.wishlistArchiver.retrieve()
        self.wishlistGames = archivedGames
        
        wishlistView.update(archivedGames, filtredWishlist, isFiltering)
    }
    
    init(provider: WishlistProvider) {
        self.wishlistProvider = provider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func filterWishlistGames(_ searchText: String) {
        self.filtredWishlist = self.wishlistGames.filter({ game in
            return game.name.lowercased().prefix(searchText.count) == searchText.lowercased()
        })
        
        wishlistView.update(wishlistGames, filtredWishlist, isFiltering)
    }
    
    private func presentGameDetailsController(_ gameId: Int) {
        wishlistProvider.router.navigateToGameDetailsController(gameId, self)
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
