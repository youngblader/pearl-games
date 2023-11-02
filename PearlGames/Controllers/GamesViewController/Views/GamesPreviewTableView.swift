//
//  GamesPreviewTableView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 27.10.23.
//

import UIKit

private enum GamesPreviewSections: Int, CaseIterable {
    case new = 0
    case comingSoon = 1
    case popularGames = 2
    case newReleases = 3
    
    var title: String {
        switch self {
        case .new:
            return "Whats New"
        case .comingSoon:
            return "Cooming Soon"
        case .popularGames:
            return "Popular Games"
        case .newReleases:
            return "New Releases"
        }
    }
}

final class GamesPreviewTableView: UITableView {
    private var gamesPreviewData: GamesPreviewData = GamesPreviewData(new: [], comingSoon: [], newReleased: [], popularGames: [])
    
    var onTappedGameCell: (()->())?
    
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
        return GamesPreviewSections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = GamesPreviewSections(rawValue: section)
        
        switch (section) {
        case .new:
            return gamesPreviewData.new.isEmpty ? 0 : 1
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
        
        let gamesCategory = GamesPreviewSections(rawValue: indexPath.section)
        
        if let title = gamesCategory?.title {
            cell.dividerView.update(title)
        }
        
        var categoryGames: [Game] {
            switch gamesCategory {
            case .new:
                return gamesPreviewData.new
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
        
        cell.update(categoryGames)
        
        cell.onTappedGameCell = {
            self.onTappedGameCell?()
        }

        return cell
    }
}
