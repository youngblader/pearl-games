//
//  RatingDistributionCollectionView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 3.11.23.
//

import UIKit

final class RatingDistributionCollectionView: UICollectionView {
    private var ratings: [DetailGameRating] = []
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.estimatedItemSize = CGSize(width: 100, height: 40)
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.showsHorizontalScrollIndicator = false
        self.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.delegate = self
        self.dataSource = self
        
        self.register(RatingDistributionCell.self, forCellWithReuseIdentifier: RatingDistributionCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ ratings: [DetailGameRating]) {
        self.ratings = ratings
        self.reloadData()
    }
}

extension RatingDistributionCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        cell?.showAnimation {}
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ratings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RatingDistributionCell.reuseId, for: indexPath) as! RatingDistributionCell
        
        let ratingItem = ratings[indexPath.row]
        
        cell.update(ratingItem)
        
        return cell
    }
}
