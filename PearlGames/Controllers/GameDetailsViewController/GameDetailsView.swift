//
//  GameDetailsView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 28.10.23.
//

import UIKit
import SnapKit

enum GameDetailsState {
    case loading
    case loaded(GameDetails, Bool)
    case error(GamesStateError)
}

final class GameDetailsView: UIView {
    var onUrlButtonTapped: ((String)->())?
    var onSaveGameTapped: ((GameDetails)->())?
    
    private let gameDetailsTableView = GameDetailsTableView()
    
    private let errorLabel = TextLabel(size: 14, color: .textGray, typeLabel: .semiBold, aligment: .center)
    
    private let acitvityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        
        return indicator
    }()
    
    //State
    var state: GameDetailsState = .loading {
        didSet {
            switch state {
            case .loading:
                gameDetailsTableView.backgroundView = acitvityIndicator
            case .loaded(let game, let gameInWishlist):
                gameDetailsTableView.backgroundView = nil
                gameDetailsTableView.update(game, gameInWishlist)
            case .error(let value):
                updateBackgroundTableView(value.rawValue)
            }
        }
    }
    
    private func updateBackgroundTableView(_ text: String) {
        errorLabel.text = text
        gameDetailsTableView.backgroundView = errorLabel
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        
        gameDetailsTableView.onUrlButtonTapped = { url in
            self.onUrlButtonTapped?(url)
        }
        
        gameDetailsTableView.onSaveGameTapped = { game in
            self.onSaveGameTapped?(game)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ game: GameDetails, _ gameInWishlist: Bool) {
        state = .loaded(game, gameInWishlist)
    }
}

extension GameDetailsView {
    private func setupViews() {
        self.addSubview(gameDetailsTableView)
    }
    
    private func setupConstraints() {
        gameDetailsTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
