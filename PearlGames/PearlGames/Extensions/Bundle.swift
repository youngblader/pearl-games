//
//  Bundle.swift
//  PearlGames
//
//  Created by Евгений Зорич on 7.10.23.
//

import Foundation

extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }

    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    
//    var releaseVersionNumberPretty: String { // тут можно сразу unwrap string
//            return "PearlGames \(releaseVersionNumber ?? "1.0.0")"
//    }
}

//Bundle.main.releaseVersionNumber
//Bundle.main.buildVersionNumber
