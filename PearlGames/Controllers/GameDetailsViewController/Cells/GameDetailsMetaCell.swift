//
//  GameDetailsMetaCell.swift
//  PearlGames
//
//  Created by Евгений Зорич on 3.11.23.
//

import UIKit
import SnapKit

final class GameDetailsMetaCell: UITableViewCell {
    static var reuseId = "GameDetailsMetaCell"
    
    private let contentStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.distribution = .equalSpacing
        stack.axis = .vertical
        stack.spacing = 10
        
        stack.alignment = .leading
        
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 16, bottom: 0, right: 16)
        stack.isLayoutMarginsRelativeArrangement = true
        
        return stack
    }()
    
    private let metacriticScoreView = MetacriticScoreView()
    
    private lazy var platformsView = GamesDetailsMetaView(title: "Platforms")
    private lazy var genresView = GamesDetailsMetaView(title: "Genres")
    private lazy var releaseDateView = GamesDetailsMetaView(title: "Release date")
    private lazy var developersView = GamesDetailsMetaView(title: "Developer")
    private lazy var publishersView = GamesDetailsMetaView(title: "Publisher")
    private lazy var tagsView = GamesDetailsMetaView(title: "Tags")
    
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
        if let platforms = game.platforms {
            let platformsString = convertArrayOfString(platforms.map ({ $0.platform.name }))
            
            platformsView.update(platformsString)
        }
        
        let genres = convertArrayOfString(game.genres.map ({ $0.name }))
        let developers = convertArrayOfString(game.developers.map ({ $0.name }))
        let publishers = convertArrayOfString(game.publishers.map ({ $0.name }))
        let tags = game.tags.map ({ "#\($0.name)" }).joined(separator: ", ")
        
        publishersView.update(publishers)
        developersView.update(developers)
        genresView.update(genres)
        tagsView.update(tags)
        
        releaseDateView.update(game.released ?? "")
        metacriticScoreView.update(game.metacritic ?? 0)
    }
    
    private func convertArrayOfString(_ array: [String]) -> String {
        return array.map({ $0 }).joined(separator: ", ")
    }
}

extension GameDetailsMetaCell {
    private func setupViews() {
        contentView.addSubview(contentStackView)
        
        contentStackView.addArrangedSubview(metacriticScoreView)
        
        contentStackView.addArrangedSubview(platformsView)
        contentStackView.addArrangedSubview(genresView)
        contentStackView.addArrangedSubview(releaseDateView)
        contentStackView.addArrangedSubview(developersView)
        contentStackView.addArrangedSubview(publishersView)
        contentStackView.addArrangedSubview(tagsView)
    }
    
    private func setupConstraints() {
        contentStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
