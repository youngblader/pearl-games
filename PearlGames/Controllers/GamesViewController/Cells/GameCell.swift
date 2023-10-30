//
//  GameCell.swift
//  PearlGames
//
//  Created by Евгений Зорич on 27.10.23.
//

import UIKit

final class GameCell: UICollectionViewCell {
    static var reuseId = "GameCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConsraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GameCell {
    private func setupViews() {
        self.backgroundColor = .purple
        self.layer.cornerRadius = 10
    }
    
    private func setupConsraints() {
        
    }
}
