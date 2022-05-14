//
//  AuthInfo.swift
//  GitHubAuth
//
//  Created by Denis Ivanov on 14.05.2022.
//

import Foundation

struct AuthInfo: Decodable {
    
    let accessToken: String
    let scope: String
    let tokenType: String
}
