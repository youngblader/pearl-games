//
//  GamesView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 18.10.23.
//

import UIKit
import SnapKit

final class GamesView: UIView {
    let gamePreviewTableView = GamesPreviewTableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
