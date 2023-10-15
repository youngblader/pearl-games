//
//  WishlistView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 9.10.23.
//

import UIKit

final class WishlistView: UIView {
    let searchController = SearchController(searchResultsController: nil)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update() {
        
    }
}

extension WishlistView {
    private func setupViews() {
        
    }
    
    private func setupConstraints() {
        
    }
}
