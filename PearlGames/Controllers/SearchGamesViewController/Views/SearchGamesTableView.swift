//
//  SearchGamesTableView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 31.10.23.
//

import UIKit

final class SearchGamesTableView: UITableView {
    private var games: [Game] = []
    private var searchGames: [Game] = []
    private var isFiltering: Bool = false
    
    var onTappedGameCell: ((Int)->())?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .plain)
        
        self.delegate = self
        self.dataSource = self
        
        self.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        self.separatorStyle = .none
        
        self.register(SearchGameCell.self, forCellReuseIdentifier: SearchGameCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ games: [Game], _ searchGames: [Game], _ isFiltering: Bool) {
        self.games = games
        self.searchGames = searchGames
        self.isFiltering = isFiltering
        
        self.reloadData()
    }
}

extension SearchGamesTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        let game: Game
        
        if isFiltering {
            game = searchGames[indexPath.row]
        } else {
            game = games[indexPath.row]
        }
        
        cell?.showAnimation {
            self.onTappedGameCell?(game.id)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return searchGames.isEmpty ? 0 : searchGames.count
        } else {
            return games.isEmpty ? 0 : games.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchGameCell.reuseId) as! SearchGameCell
        
        let game: Game
        
        if isFiltering {
            game = searchGames[indexPath.row]
        } else {
            game = games[indexPath.row]
        }
        
        cell.selectionStyle = .none
        
        cell.update(game)
        
        return cell
    }
}
