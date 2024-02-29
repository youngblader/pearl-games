//
//  WishlistArchiverImpl.swift
//  PearlGames
//
//  Created by Евгений Зорич on 30.10.23.
//

import Foundation

protocol WishlistArchiver {
    func save(_ game: [GameDetails])
    func retrieve() -> [GameDetails]
    func remove() -> [GameDetails]
}

final class WishlistArchiverImpl: WishlistArchiver {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "Wishlist"
    
    func save(_ game: [GameDetails]) {
        do {
            let data = try encoder.encode(game)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("!!!!ERROR", error)
        }
    }
    
    func retrieve() -> [GameDetails] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        
        do {
            let array = try decoder.decode([GameDetails].self, from: data)
            
            return array
        } catch {
            print("!!!!ERROR", error)
        }
        
        return []
    }
    
    func remove() -> [GameDetails] {
        UserDefaults.standard.removeObject(forKey: key)
        return []
    }
}
