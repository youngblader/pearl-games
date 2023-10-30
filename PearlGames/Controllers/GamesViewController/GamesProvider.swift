//
//  GamesProvider.swift
//  PearlGames
//
//  Created by Евгений Зорич on 18.10.23.
//

import Foundation

protocol GamesProvider {
    var router: Router { get }
}

final class GamesProviderImpl: GamesProvider {
    var router: Router
    
    //MARK: Dependencies
    init(router: Router) {
        self.router = router
    }
}
