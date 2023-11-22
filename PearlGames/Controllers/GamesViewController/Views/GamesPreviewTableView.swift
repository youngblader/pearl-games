//
//  GamesPreviewTableView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 27.10.23.
//

import UIKit

final class GamesPreviewTableView: UITableView {
    private var gamesPreviewData: GamesPreviewData = GamesPreviewData(comingSoon: [], newReleased: [], popularGames: [])
    
    var onGamePreviewCellTapped: ((Int)->())?
    var onGameCategoryTapped: ((GameCategory)->())?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .plain)
        
        self.delegate = self
        self.dataSource = self
        
        self.separatorStyle = .none
        
        self.register(GamesPreviewCell.self, forCellReuseIdentifier: GamesPreviewCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Public update
    func update(_ data: GamesPreviewData) {
        self.gamesPreviewData = data
        self.reloadData()
    }
}

extension GamesPreviewTableView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return GamesCategory.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = GamesCategory(rawValue: section)
        
        switch (section) {
        case .comingSoon:
            return gamesPreviewData.comingSoon.isEmpty ? 0 : 1
        case .newReleases:
            return gamesPreviewData.newReleased.isEmpty ? 0 : 1
        case .popularGames:
            return gamesPreviewData.popularGames.isEmpty ? 0 : 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GamesPreviewCell.reuseId, for: indexPath) as! GamesPreviewCell
        
        let gamesCategorySection = GamesCategory(rawValue: indexPath.section)
        
        if let category = gamesCategorySection {
            let gameCategory: GameCategory = (category.title, category.rawValue)
            
            cell.dividerView.update(category.title)
            
            cell.dividerView.onGameCategoryTapped = {
                self.onGameCategoryTapped?(gameCategory)
            }
        }
        
        var categoryGamesData: [Game] {
            switch gamesCategorySection {
            case .comingSoon:
                return gamesPreviewData.comingSoon
            case .newReleases:
                return gamesPreviewData.newReleased
            case .popularGames:
                return gamesPreviewData.popularGames
            case .none:
                return []
            }
        }
        
        cell.selectionStyle = .none
        
        cell.update(categoryGamesData)
        
        cell.onGamePreviewCellTapped = { gameId in
            self.onGamePreviewCellTapped?(gameId)
        }
        
        return cell
    }
}
