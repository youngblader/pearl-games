//
//  GameDetailsFooterCell.swift
//  PearlGames
//
//  Created by Евгений Зорич on 18.11.23.
//

import UIKit
import SnapKit

final class GameDetailsFooterCell: UITableViewCell {
    static var reuseId = "GameDetailsFooterCell"
    
    var websiteUrl: String?
    var onWebsiteUrlTapped: ((String)->())?

    private let containerStack: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        
        return stack
    }()

    private let storesView = UIView()
    
    private let websiteStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 10
        stack.alignment = .leading
        
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 16, bottom: 0, right: 16)
        stack.isLayoutMarginsRelativeArrangement = true
        
        return stack
    }()

    private let storesCollectionView = StoresCollectionView()

    private let titleLabel = TextLabel(label: "Where to buy", size: 14, color: .gray, fontLabel: .semiBold)
    private let websiteLabel = TextLabel(label: "Website", size: 14, color: .gray, fontLabel: .semiBold)
    
    private lazy var websiteButton: UIButton = {
        let button = UIButton()
        
        button.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 12)
        button.titleLabel?.textAlignment = .left
        
        button.addTarget(self, action: #selector(onWebsiteButtonTapped), for: .touchUpInside)
        
        return button
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
        self.websiteUrl = game.website
        
        if game.stores.isEmpty {
            storesView.isHidden = true
        } else {
            storesCollectionView.update(game.stores)
        }
            
        if game.website.isEmpty {
            websiteStackView.isHidden = true
        } else {
            websiteButton.setTitle(game.website, for: .normal)
        }
    }
    
    //MARK: Actions
    @objc private func onWebsiteButtonTapped() {
        if let url = websiteUrl {
            self.onWebsiteUrlTapped?(url)
        }
    }
}

extension GameDetailsFooterCell {
    private func setupViews() {
        contentView.addSubview(containerStack)
        
        containerStack.addArrangedSubview(storesView)
        containerStack.addArrangedSubview(websiteStackView)
        
        storesView.addSubview(titleLabel)
        storesView.addSubview(storesCollectionView)
        
        websiteStackView.addArrangedSubview(websiteLabel)
        websiteStackView.addArrangedSubview(websiteButton)
    }
    
    private func setupConstraints() {
        containerStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(storesView).inset(10)
            make.left.right.equalTo(storesView).inset(16)
        }

        storesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.right.bottom.equalTo(storesView)
        }
    }
}
