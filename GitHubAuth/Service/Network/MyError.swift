//
//  MyError.swift
//  GitHubAuth
//
//  Created by Denis Ivanov on 14.05.2022.
//

import Foundation

enum MyError: Error {
    
    case invalidRequest
    case unknown
    case spoofingSecretIdentifier
}
