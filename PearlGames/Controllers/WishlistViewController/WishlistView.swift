//
//  WishlistView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 9.10.23.
//

import UIKit
import SnapKit

//State Pattern
enum WishlistState {
    case loaded([GameDetails], [GameDetails], Bool)
    case noData(GamesStateError)
    case noFiltredData(GamesStateError)
}

final class WishlistView: UIView {
    var onWishlistGameTapped: ((Int)->())?
    
    lazy var searchController = SearchController(searchResultsController: nil)
    private let wishlistTableView = WishlistTableView()
    
    private let errorLabel = TextLabel(size: 14, color: .textGray, fontLabel: .semiBold, aligment: .center)
    
    //State
    var state: WishlistState = .noData(.noData) {
        didSet {
            switch state {
            case .loaded(let wishlistGames, let filtredGames, let isFiltering):
                wishlistTableView.backgroundView = nil
                wishlistTableView.update(wishlistGames, filtredGames, isFiltering)
            case .noData(let value), .noFiltredData(let value):
                updateTableViewBackgroundView(value.rawValue)
            }
        }
    }
    
    private func updateTableViewBackgroundView(_ text: String) {
        errorLabel.text = text
        wishlistTableView.backgroundView = errorLabel
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        
        wishlistTableView.onWishlistGameTapped = { gameId in
            self.onWishlistGameTapped?(gameId)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ wishlistGames: [GameDetails], _ filtredGames: [GameDetails], _ isFiltering: Bool) {
        state = .loaded(wishlistGames, filtredGames, isFiltering)
        
        if wishlistGames.isEmpty {
            state = .noData(.noData)
            return
        }
        
        if isFiltering && filtredGames.isEmpty {
            state = .noFiltredData(.noResults)
        }
    }
}

extension WishlistView {
    private func setupViews() {
        self.addSubview(wishlistTableView)
    }
    
    private func setupConstraints() {
        wishlistTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
