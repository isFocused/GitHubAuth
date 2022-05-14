//
//  UrlConfigureProtocol.swift
//  GitHubAuth
//
//  Created by Denis Ivanov on 14.05.2022.
//

import Foundation

protocol UrlConfigureProtocol {
    
    var scheme: String { get }
    var host: String { get }
    var method: HttpMethod { get }
    var path: String { get }
    var queryParametrs: [String: String] { get }
    var headers: [String: String] { get }
    
    func setupUrl() -> URL?
}

extension UrlConfigureProtocol {
    
    var scheme: String {
        "https"
    }
    
    var host: String {
        "api.github.com"
    }
    
    var method: HttpMethod {
        .get
    }
    
    var path: String {
        "фыв"
    }
    
    var queryParametrs: [String: String] {
        ["client_id": "", "client_secret": "", "code": "", "redirect_uri": ""]
    }
    
    var headers: [String: String] {
        ["Accept": "application/json"]
    }
    
    func setupUrl() -> URL? {
        var componnets = URLComponents()
        componnets.scheme = scheme
        componnets.host = host
        componnets.path = path
        componnets.queryItems = queryParametrs.map { URLQueryItem(name: $0.key, value: $0.value) }
        return componnets.url
    }
}

enum HttpMethod: String {
    
    case get = "GET"
    case post = "POST"
}
