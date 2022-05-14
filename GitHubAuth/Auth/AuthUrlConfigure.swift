//
//  AuthUrlConfigure.swift
//  GitHubAuth
//
//  Created by Denis Ivanov on 14.05.2022.
//

import Foundation

enum AuthUrlConfigure: UrlConfigureProtocol {
    
    case initialAutorization(_ securityIdentifier: String)
    case authorization
    case unauthorization
    
    var method: HttpMethod {
        switch self {
        case .authorization:
            return .post
        default:
            return .get
        }
    }
    
    var host: String {
        "github.com"
    }
    
    var path: String {
        switch self {
        case .initialAutorization:
            return "/login/oauth/authorize"
        case .authorization:
            return ""
        case .unauthorization:
            return ""
        }
    }
    
    var queryParametrs: [String: String] {
        switch self {
        case .initialAutorization(let securityIdentifier):
            return ["client_id": "810ecf9d4bb6ede9a486", "scope": "repo", "state": securityIdentifier, "allow_signup": "false"]
        case .authorization:
            return [:]
        case .unauthorization:
            return [:]
        }
    }
}
