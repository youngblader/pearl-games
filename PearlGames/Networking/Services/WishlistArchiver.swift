//
//  WishlistArchiverImpl.swift
//  PearlGames
//
//  Created by Евгений Зорич on 30.10.23.
//

import Foundation

protocol WishlistArchiver {
    func save(_ game: [Game])
    func retrieve() -> [Game]
    func remove() -> [Game]
}

final class WishlistArchiverImpl: WishlistArchiver {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "Wishlist"
    
    func save(_ game: [Game]) {
        do {
            let data = try encoder.encode(game)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieve() -> [Game] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        
        do {
            let array = try decoder.decode([Game].self, from: data)
            
            return array
        } catch {
            print(error)
        }
        
        return []
    }
    
    func remove() -> [Game] {
        UserDefaults.standard.removeObject(forKey: key)
        return []
    }
}
