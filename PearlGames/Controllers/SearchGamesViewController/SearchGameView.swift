//
//  SearchGameView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 20.10.23.
//

import UIKit
import SnapKit

final class SearchGameView: UIView {
    lazy var searchController = SearchController(searchResultsController: nil)
    let searchGamesTableView = SearchGamesTableView()
    
    private let errorLabel = TextLabel(size: 14, color: .textGray, typeLabel: .semiBold, aligment: .center)
    
    private let acitvityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        
        return indicator
    }()
    
    //State
    var state: SearchGamesState = .loading {
        didSet {
            switch state {
            case .loading:
                searchGamesTableView.backgroundView = acitvityIndicator
            case .loaded(let games, let searchedGames, let isFiltering), .filtred(let games, let searchedGames, let isFiltering):
                searchGamesTableView.backgroundView = nil
                searchGamesTableView.update(games, searchedGames, isFiltering)
            case .noFiltredData(let value), .error(let value):
                updateTableViewBackgroundView(value.rawValue)
            }
        }
    }
    
    private func updateTableViewBackgroundView(_ text: String) {
        errorLabel.text = text
        searchGamesTableView.backgroundView = errorLabel
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ games: [Game], _ searchGames: [Game], _ isFiltering: Bool) {
        print("HERE1")
        
        if isFiltering && searchGames.isEmpty {
            state = .noFiltredData(.noResults)
        } else {
            state = .filtred(games, searchGames, isFiltering)
            return
        }
        
        state = .loaded(games, searchGames, isFiltering)
    }
}

extension SearchGameView {
    private func setupViews() {
        self.addSubview(searchGamesTableView)
    }
    
    private func setupConstraints() {
        searchGamesTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
