//
//  GamesPreviewCell.swift
//  PearlGames
//
//  Created by Евгений Зорич on 27.10.23.
//

import UIKit
import SnapKit

final class GamesPreviewCell: UITableViewCell {
    static var reuseId = "GamesPreviewCell"
    
    var onGamePreviewCellTapped: ((Int)->())?
    
    let dividerView = DividerView()
    private let gamesCollectionView = GamesCollectionView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConsraints()
        
        gamesCollectionView.onGameCellTapped = { gameId in
            self.onGamePreviewCellTapped?(gameId)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ games: [Game]) {
        gamesCollectionView.update(games)
    }
}

extension GamesPreviewCell {
    private func setupViews() {
        contentView.addSubview(dividerView)
        contentView.addSubview(gamesCollectionView)
    }
    
    private func setupConsraints() {
        dividerView.snp.makeConstraints { make in
            make.top.left.right.equalTo(contentView)
        }
        
        gamesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(dividerView.snp.bottom)
            make.left.right.bottom.equalTo(contentView)
        }
    }
}
