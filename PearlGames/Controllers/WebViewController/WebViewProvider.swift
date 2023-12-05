//
//  WebViewProvider.swift
//  PearlGames
//
//  Created by Евгений Зорич on 11.11.23.
//

import Foundation

protocol WebViewProvider {
    var router: Router { get }
}

final class WebViewProviderImpl: WebViewProvider {
    var router: Router
    
    //MARK: Dependencies
    init(router: Router) {
        self.router = router
    }
}
