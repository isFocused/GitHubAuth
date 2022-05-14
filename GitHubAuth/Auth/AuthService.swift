//
//  AuthService.swift
//  GitHubAuth
//
//  Created by Denis Ivanov on 14.05.2022.
//

import Foundation

protocol AuthServiceProtocol {
    
    func initialLogIn() -> URL?
    func logIn()
    func logOut()
}

final class AuthService: AuthServiceProtocol {
    
    private let networkRequestService: NetworkRequestService
    private let securityId: UUID
    
    init(networkRequestService: NetworkRequestService = NetworkRequestService()) {
        self.networkRequestService = networkRequestService
        securityId = UUID()
    }
    
    func initialLogIn() -> URL? {
        AuthUrlConfigure.initialAutorization(securityId.uuidString).setupUrl()
    }
    
    func logIn() {
        let urlConfigure = AuthUrlConfigure.authorization
        networkRequestService.initiateRequest(from: urlConfigure) { (result: Result<AuthInfo, Error>) in
            
        }
    }
    
    func logOut() {
    }
}
