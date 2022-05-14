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
    
    private let webView = WKWebView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureWebView()
    }
    
    private func configureWebView() {
        view.addSubview(webView)
        webView.pinAllEdgesSuperView()
        guard let url = viewModel?.initiateAuthorization() else { return }
        webView.load(URLRequest(url: url))
    }
}
