//
//  GamesView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 18.10.23.
//

import UIKit
import SnapKit

//State Pattern
enum GamesState {
    case loading
    case loaded(GamesPreviewData)
    case noData(GamesStateError)
    case error(GamesStateError)
}

final class GamesView: UIView {
    let gamePreviewTableView = GamesPreviewTableView()
    
    private let errorLabel = TextLabel(size: 14, color: .textGray, fontLabel: .semiBold, aligment: .center)
    
    private let acitvityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        
        return indicator
    }()
    
    //State
    var state: GamesState = .loading {
        didSet {
            switch state {
            case .loading:
                gamePreviewTableView.backgroundView = acitvityIndicator
            case .loaded(let data):
                gamePreviewTableView.update(data)
            case .error(let value), .noData(let value):
                errorLabel.text = value.rawValue
                gamePreviewTableView.backgroundView = errorLabel
            }
        }
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
    func update(_ data: GamesPreviewData) {
        let isEmptyData = data.comingSoon.isEmpty && data.newReleased.isEmpty && data.popularGames.isEmpty
        
        if isEmptyData {
            state = .noData(.noData)
        } else {
            state = .loaded(data)
        }
    }
}

extension GamesView {
    private func setupViews() {
        self.addSubview(gamePreviewTableView)
    }
    
    private func setupConstraints() {
        gamePreviewTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
