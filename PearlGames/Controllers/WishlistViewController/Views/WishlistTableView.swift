//
//  WishlistTableView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 16.11.23.
//

import UIKit

final class WishlistTableView: UITableView {
    private var wishlistGames: [GameDetails] = []
    private var filtredGames: [GameDetails] = []
    private var isFiltering: Bool = false
    
    var onWishlistGameTapped: ((Int)->())?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .plain)
        
        self.delegate = self
        self.dataSource = self
        
        self.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        self.separatorStyle = .none
        
        self.register(WishlistGameCell.self, forCellReuseIdentifier: WishlistGameCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ wishlistGames: [GameDetails], _ filtredGames: [GameDetails], _ isFiltering: Bool) {
        self.wishlistGames = wishlistGames
        self.filtredGames = filtredGames
        self.isFiltering = isFiltering
        
        self.reloadData()
    }
}

extension WishlistTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        let game: GameDetails
        
        if isFiltering {
            game = filtredGames[indexPath.row]
        } else {
            game = wishlistGames[indexPath.row]
        }
        
        cell?.showAnimation {
            self.onWishlistGameTapped?(game.id)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filtredGames.count
        }
        return wishlistGames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WishlistGameCell.reuseId) as! WishlistGameCell
        
        let game: GameDetails
        
        if isFiltering {
            game = filtredGames[indexPath.row]
        } else {
            game = wishlistGames[indexPath.row]
        }
        
        cell.selectionStyle = .none
        
        cell.update(game)
        
        return cell
    }
}
