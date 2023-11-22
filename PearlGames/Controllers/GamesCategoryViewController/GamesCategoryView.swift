//
//  GamesCategoryView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 30.10.23.
//

import UIKit
import SnapKit

//State Pattern
enum GamesCategoryState {
    case loading
    case loaded([Game])
    case noData(GamesStateError)
    case error(GamesStateError)
}

enum ButtonEvent {
    case show, hide
}

final class GamesCategoryView: UIView {
    let gamesCategoryCollectionView = GamesCategoryCollectionView()
    
    private let errorLabel = TextLabel(size: 14, color: .textGray, typeLabel: .semiBold, aligment: .center)
    
    private let acitvityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        
        return indicator
    }()
    
    private lazy var arrowUpButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "chevron.up"), for: .normal)
        
        button.tintColor = .white
        
        button.backgroundColor = .lightBlack
        button.layer.borderColor = UIColor.borderButtonColor.withAlphaComponent(0.2).cgColor
        
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 1
        
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        button.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
        
        button.addTarget(self, action: #selector(arrowUpButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    //State
    var state: GamesCategoryState = .loading {
        didSet {
            switch state {
            case .loading:
                gamesCategoryCollectionView.backgroundView = acitvityIndicator
            case .loaded(let data):
                gamesCategoryCollectionView.backgroundView = nil
                gamesCategoryCollectionView.update(data)
            case .error(let value):
                updateTableViewBackgroundView(value.rawValue)
            case .noData(let value):
                updateTableViewBackgroundView(value.rawValue)
            }
        }
    }
    
    private func updateTableViewBackgroundView(_ text: String) {
        errorLabel.text = text
        gamesCategoryCollectionView.backgroundView = errorLabel
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        
        gamesCategoryCollectionView.onShowingArrowUpButton = { action in
            self.showingArrowUpButton(action)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showingArrowUpButton(_ action: ButtonEvent) {
        switch action {
        case .show:
            UIView.animate(withDuration: 0.2, delay: 0.25) {
                self.arrowUpButton.transform = CGAffineTransform.identity
            }
        case .hide:
            UIView.animate(withDuration: 0.2) {
                self.arrowUpButton.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            }
        }
    }
    
    //MARK: Public update
    func update(_ games: [Game]) {
        state = .loaded(games)
    }
    
    //MARK: Actions
    @objc private func arrowUpButtonTapped() {
        gamesCategoryCollectionView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
}

extension GamesCategoryView {
    private func setupViews() {
        self.addSubview(gamesCategoryCollectionView)
        self.addSubview(arrowUpButton)
    }
    
    private func setupConstraints() {
        gamesCategoryCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        arrowUpButton.snp.makeConstraints { make in
            make.right.equalTo(self).inset(20)
            make.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
