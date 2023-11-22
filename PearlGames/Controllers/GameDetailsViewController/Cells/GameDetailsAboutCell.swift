//
//  GameAboutCell.swift
//  PearlGames
//
//  Created by Евгений Зорич on 3.11.23.
//

import UIKit
import SnapKit

final class GameDetailsAboutCell: UITableViewCell {
    static var reuseId = "GameDetailsAboutCell"
    
    private let subTitleLabel = TextLabel(label: "About", size: 18, color: .white, typeLabel: .semiBold)
    
    private let descriptionLabel = TextLabel(size: 14, color: .white, typeLabel: .regular)
    
    private let contentStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.distribution = .equalSpacing
        stack.axis = .vertical
        stack.spacing = 10
        
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 16, bottom: 0, right: 16)
        stack.isLayoutMarginsRelativeArrangement = true
        
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ game: GameDetails) {
        descriptionLabel.text = game.descriptionRaw
    }
}

extension GameDetailsAboutCell {
    private func setupViews() {
        contentView.addSubview(contentStackView)
        
        contentStackView.addArrangedSubview(subTitleLabel)
        contentStackView.addArrangedSubview(descriptionLabel)
    }
    
    private func setupConstraints() {
        contentStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
