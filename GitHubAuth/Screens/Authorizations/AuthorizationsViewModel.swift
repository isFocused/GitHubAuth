//
//  AuthorizationsViewModel.swift
//  GitHubAuth
//
//  Created by Дарья Полякова on 14.05.2022.
//

import Foundation

protocol AuthorizationsViewModelProtocol {
    
    func initiateAuthorization() -> URL?
}

class AuthorizationsViewModel: AuthorizationsViewModelProtocol {
    
    private let authSecrvice: AuthServiceProtocol
    
    init(authSecrvice: AuthServiceProtocol = AuthService()) {
        self.authSecrvice = authSecrvice
    }
    
    func initiateAuthorization() -> URL? {
        authSecrvice.initialLogIn()
    }
}
