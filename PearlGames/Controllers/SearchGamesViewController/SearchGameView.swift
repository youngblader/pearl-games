//
//  SearchGameView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 20.10.23.
//

import UIKit

final class SearchGameView: UIView {
    let searchGamesController = SearchController(searchResultsController: nil)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchGameView {
    private func setupViews() {
        
    }
    
    private func setupConstraints() {
        
    }
}
