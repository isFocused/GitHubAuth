//
//  NetworkRequestService.swift
//  GitHubAuth
//
//  Created by Denis Ivanov on 14.05.2022.
//

import Foundation

class NetworkRequestService {
    
    private let networkService: NetworkServiseProtocol
    
    init(networkService: NetworkServiseProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func initiateRequest<T: Decodable>(from configUrl: UrlConfigureProtocol, completion: @escaping ((Result<T, Error>) -> ())) {
        do {
            networkService.request(request: try createRequest(configUrl), completion: completion)
        } catch {
            completion(.failure(error))
        }
    }
    
    private func createRequest(_ configUrl: UrlConfigureProtocol) throws -> URLRequest {
        guard let url = configUrl.setupUrl() else { throw MyError.invalidRequest }
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = configUrl.headers
        urlRequest.httpMethod = configUrl.method.rawValue
        return urlRequest
    }
}
