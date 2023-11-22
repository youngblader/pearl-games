//
//  StoresCollectionView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 11.11.23.
//

import UIKit

final class StoresCollectionView: UICollectionView {
    private var stores: [DetailGameStores] = []
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.estimatedItemSize = CGSize(width: 100, height: 50)
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.showsHorizontalScrollIndicator = false
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.delegate = self
        self.dataSource = self
        
        self.register(StoreCell.self, forCellWithReuseIdentifier: StoreCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ stores: [DetailGameStores]) {
        self.stores = stores
        self.reloadData()
    }
}

extension StoresCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        cell?.showAnimation {}
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stores.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoreCell.reuseId, for: indexPath) as! StoreCell
        
        let storeItem = stores[indexPath.row]
        
        cell.update(storeItem.store)
        
        return cell
    }
}
