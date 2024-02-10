//
//  GameCategoryCell.swift
//  PearlGames
//
//  Created by Евгений Зорич on 3.11.23.
//

import UIKit
import SnapKit
import SDWebImage

final class GameCategoryCell: UICollectionViewCell {
    static var reuseId = "GameCategoryCell"
    
    private let gameNameLabel = TextLabel(size: 14, fontLabel: .semiBold, linesNumber: 1)
    private let genreGameLabel = TextLabel(size: 12, color: .gray, fontLabel: .medium)
    
    private let gameImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        
        imageView.layer.maskedCorners  = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyleCell()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ game: Game) {
        gameNameLabel.text = game.name
        gameImageView.sd_setImage(with: URL(string: game.backgroundImage ?? ""))
        
        if let genre = game.genres.first?.name {
            genreGameLabel.text = genre
        }
    }
}

extension GameCategoryCell {
    private func setupStyleCell() {
        contentView.backgroundColor = .lightBlack
        contentView.layer.borderColor = UIColor.borderButtonColor.withAlphaComponent(0.2).cgColor
        
        contentView.layer.borderWidth = 0.5
        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = true
    }
    
    private func setupViews() {
        contentView.addSubview(gameImageView)
        contentView.addSubview(gameNameLabel)
        contentView.addSubview(genreGameLabel)
    }
    
    private func setupConstraints() {
        gameImageView.snp.makeConstraints { make in
            make.top.left.right.equalTo(contentView)
        }
        
        gameNameLabel.snp.makeConstraints { make in
            make.top.equalTo(gameImageView.snp.bottom).offset(10)
            make.left.right.equalTo(contentView).inset(10)
        }
        
        genreGameLabel.snp.makeConstraints { make in
            make.top.equalTo(gameNameLabel.snp.bottom).offset(8)
            make.left.right.equalTo(contentView).inset(10)
        }
    }
}
