//
//  WebKitView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 11.11.23.
//

import UIKit
import WebKit

final class WebKitView: WKWebView {
    var onWebViewStateAction: ((WebViewState)->())?
    
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
        onWebViewStateAction?(.loading)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        onWebViewStateAction?(.loaded)
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        onWebViewStateAction?(.error)
    }
}
