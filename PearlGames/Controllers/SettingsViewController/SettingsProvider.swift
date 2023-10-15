//
//  SettingsProvider.swift
//  PearlGames
//
//  Created by Евгений Зорич on 10.10.23.
//

import Foundation

protocol SettingsProvider {
    var router: Router { get }
}

final class SettingsProviderImpl: SettingsProvider {
    var router: Router
    
    //MARK: Dependencies
    init(router: Router) {
        self.router = router
    }
}
