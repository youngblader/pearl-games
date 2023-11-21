//
//  WebView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 11.11.23.
//

import UIKit
import SnapKit
import WebKit

enum WebViewState {
    case loading
    case loaded
    case error
}

final class WebView: UIView {
    lazy var webKitView = WebKitView()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        
        return indicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        
        webKitView.onWebViewStateAction = { action in
            self.handlingStateWebViewAction(action)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func handlingStateWebViewAction(_ stateAction: WebViewState) {
        switch stateAction {
        case .loading:
            activityIndicator.startAnimating()
        case .loaded, .error:
            activityIndicator.stopAnimating()
        }
    }
}

extension WebView {
    private func setupViews() {
        self.addSubview(webKitView)
        self.addSubview(activityIndicator)
    }
    
    private func setupConstraints() {
        webKitView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(self)
        }
    }
}
