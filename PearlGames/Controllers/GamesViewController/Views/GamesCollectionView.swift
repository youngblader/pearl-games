//
//  GamesCollectionView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 27.10.23.
//

import UIKit

final class GamesCollectionView: UICollectionView {
    private let games: [Game] = []
    
    var onTappedGameCell: (()->())?

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.itemSize = CGSize(width: 120, height: 120)
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.showsHorizontalScrollIndicator = false
        self.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        self.delegate = self
        self.dataSource = self
        
        self.backgroundColor = .yellow
        
        self.register(GameCell.self, forCellWithReuseIdentifier: GameCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update() {
        
    }
}

extension GamesCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        cell?.showAnimation {
            self.onTappedGameCell?()
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCell.reuseId, for: indexPath) as! GameCell
        
        return cell
    }
}
