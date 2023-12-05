//
//  GamesCategoryCollectionView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 3.11.23.
//

import UIKit

final class GamesCategoryCollectionView: UICollectionView {
    private var games: [Game] = []
    
    var onGameCellTapped: ((Int)->())?
    var onShowingArrowUpButton: ((ButtonEvent)->())?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        
        let leftAndRightPaddings: CGFloat = 45.0
        let numberOfItemsRow: CGFloat = 2.0
    
        let width = (UIScreen.main.bounds.width - leftAndRightPaddings) / numberOfItemsRow
          
        layout.itemSize = CGSize(width: width, height: 180)
        
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 20, right: 16)
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.delegate = self
        self.dataSource = self
        
        self.register(GameCategoryCell.self, forCellWithReuseIdentifier: GameCategoryCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ games: [Game]) {
        self.games = games
        self.reloadData()
    }
}

extension GamesCategoryCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        
        if contentOffsetY > 200 {
            onShowingArrowUpButton?(.show)
        } else {
            onShowingArrowUpButton?(.hide)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)        
        
        let game = games[indexPath.row]
        
        cell?.showAnimation {
            self.onGameCellTapped?(game.id)
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCategoryCell.reuseId, for: indexPath) as! GameCategoryCell
        
        let game = games[indexPath.row]
        
        cell.update(game)
        
        return cell
    }
}
