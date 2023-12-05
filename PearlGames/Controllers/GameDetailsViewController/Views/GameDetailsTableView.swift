//
//  GameDetailsTableView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 3.11.23.
//

import UIKit

private enum GameDetailsSections: Int, CaseIterable {
    case gameHeader, gameMeta, gameFooter
}

final class GameDetailsTableView: UITableView {
    private var game: GameDetails?
    private var gameInWishlist: Bool = false
    
    var onWebsiteUrlTapped: ((String)->())?
    var onSaveGameTapped: ((GameDetails)->())?
    
    private let gameDetailsTableHeaderView = GameDetailsTableHeaderView (frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 250))
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .plain)
        
        self.delegate = self
        self.dataSource = self
        
        self.tableHeaderView = gameDetailsTableHeaderView
        
        self.separatorStyle = .none
        self.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 20, right: 0)
        
        self.allowsSelection = false
        
        self.register(GameDetailsHeaderCell.self, forCellReuseIdentifier: GameDetailsHeaderCell.reuseId)
        self.register(GameDetailsMetaCell.self, forCellReuseIdentifier: GameDetailsMetaCell.reuseId)
        self.register(GameDetailsFooterCell.self, forCellReuseIdentifier: GameDetailsFooterCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ game: GameDetails, _ gameInWishlist: Bool) {
        self.game = game
        self.gameInWishlist = gameInWishlist
        
        self.gameDetailsTableHeaderView.update(game.backgroundImage)
        self.reloadData()
    }
}

extension GameDetailsTableView: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return GameDetailsSections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return game != nil ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let gameDetails = game else { return UITableViewCell() }
        
        let section = GameDetailsSections.init(rawValue: indexPath.section)
        
        switch section {
        case .gameHeader:
            let cell = tableView.dequeueReusableCell(withIdentifier: GameDetailsHeaderCell.reuseId, for: indexPath) as! GameDetailsHeaderCell
            
            cell.onSaveGameTapped = {
                self.onSaveGameTapped?(gameDetails)
            }
            
            cell.update(gameDetails, gameInWishlist)
            
            return cell
        case .gameMeta:
            let cell = tableView.dequeueReusableCell(withIdentifier: GameDetailsMetaCell.reuseId, for: indexPath) as! GameDetailsMetaCell
            
            cell.update(gameDetails)
            
            return cell
        case .gameFooter:
            let cell = tableView.dequeueReusableCell(withIdentifier: GameDetailsFooterCell.reuseId, for: indexPath) as! GameDetailsFooterCell
            
            cell.onWebsiteUrlTapped = { url in
                self.onWebsiteUrlTapped?(url)
            }
            
            cell.update(gameDetails)
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let headerView = self.tableHeaderView as! GameDetailsTableHeaderView
        headerView.scrollViewDidScroll(scrollView: scrollView)
    }
}
