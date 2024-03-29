//
//  WebViewController.swift
//  PearlGames
//
//  Created by Евгений Зорич on 11.11.23.
//

import UIKit
import SnapKit

final class WebViewController: UIViewController {
    private let webviewProvider: WebViewProvider
    
    private var gameUrl: String
    
    // LoadView
    private var webView: WebView {
        return self.view as! WebView
    }
    
    override func loadView() {
        self.view = WebView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadUrl(gameUrl)
    }
    
    init(url: String, provider: WebViewProvider) {
        self.webviewProvider = provider
        self.gameUrl =  url
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadUrl(_ url: String) {
        guard let url = URL(string: url) else { return }
        
        let request = URLRequest(url: url)
        webView.webKitView.load(request)
    }
}
