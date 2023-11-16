//
//  WebKitView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 11.11.23.
//

import UIKit
import WebKit

final class WebKitView: WKWebView {
    var onIndicatorAction: ((IndicatorAction)->())?
    
    override init(frame: CGRect, configuration: WKWebViewConfiguration) {
        let webConfiguration = WKWebViewConfiguration()
        
        super.init(frame: .zero, configuration: webConfiguration)
        
        self.backgroundColor = .black
        self.isOpaque = false
        
        self.uiDelegate = self
        self.navigationDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WebKitView: WKUIDelegate, WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        onIndicatorAction?(.start)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        onIndicatorAction?(.stop)
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        onIndicatorAction?(.stop)
    }
}
