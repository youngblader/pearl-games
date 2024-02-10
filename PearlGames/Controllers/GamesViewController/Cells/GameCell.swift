//
//  GameCell.swift
//  PearlGames
//
//  Created by Евгений Зорич on 27.10.23.
//

import UIKit
import SnapKit
import SDWebImage

final class GameCell: UICollectionViewCell {
    static var reuseId = "GameCell"
    
    private let gameImageView: UIImageView = {
        let image = UIImageView()
        
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 25
        image.layer.masksToBounds = true
        
        image.widthAnchor.constraint(equalToConstant: 100).isActive = true
        image.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
        return image
    }()
    
    private let containerImageView = UIView()
    
    private let titleGameLabel = TextLabel(size: 14, color: .white, fontLabel: .medium, aligment: .left, linesNumber: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConsraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ game: Game) {
        titleGameLabel.text = game.name
        gameImageView.sd_setImage(with: URL(string: game.backgroundImage ?? ""))
    }
}

extension GameCell {
    private func setupViews() {
        contentView.addSubview(containerImageView)
        contentView.addSubview(titleGameLabel)
        
        containerImageView.addSubview(gameImageView)
    }
    
    private func setupConsraints() {
        containerImageView.snp.makeConstraints { make in
            make.top.left.right.equalTo(contentView)
        }
        
        gameImageView.snp.makeConstraints { make in
            make.edges.equalTo(containerImageView)
        }
        
        titleGameLabel.snp.makeConstraints { make in
            make.top.equalTo(containerImageView.snp.bottom).offset(10)
            make.left.right.equalTo(contentView)
        }
    }
}
