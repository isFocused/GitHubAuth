//
//  AuthViewController.swift
//  GitHubAuth
//
//  Created by Дарья Полякова on 14.05.2022.
//

import UIKit
import WebKit

class AuthorizationsViewController: UIViewController {

    var viewModel: AuthorizationsViewModelProtocol? = AuthorizationsViewModel()
    
    private let webView: WKWebView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(WKWebView(frame: .zero))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWebView()
        configureWebView()
    }
    
    private func setupWebView() {
        
        view.addSubview(webView)
        webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
    
    private func configureWebView() {
        guard let url = viewModel?.initiateAuthorization() else { return }
        webView.load(URLRequest(url: url))
    }
}
