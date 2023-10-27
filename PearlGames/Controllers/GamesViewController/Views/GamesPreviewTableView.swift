//
//  GamesPreviewTableView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 27.10.23.
//

import UIKit

enum GamesPreviewSections: Int, CaseIterable {
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
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .plain)
        
        self.delegate = self
        self.dataSource = self
        
        self.register(GamesPreviewCell.self, forCellReuseIdentifier: GamesPreviewCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Public update
    func update(_ games: [Game]) {
        
    }
}

extension GamesPreviewTableView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return GamesPreviewSections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GamesPreviewCell.reuseId, for: indexPath) as! GamesPreviewCell
        
        let category = GamesPreviewSections(rawValue: indexPath.section)
        
        if let category {
            cell.dividerView.update(category.title)
            print("HERES", category.title)
        }

        return cell
    }
}
