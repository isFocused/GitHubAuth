//
//  NetworkService.swift
//  GitHubAuth
//
//  Created by Denis Ivanov on 14.05.2022.
//

import Foundation

protocol NetworkServiseProtocol {
    
    func request<T: Decodable>(request: URLRequest, completion: @escaping ((Result<T, Error>) -> ()))
    func cancel()
}

final class NetworkService: NetworkServiseProtocol {
    
    private var task: URLSessionDataTask?
    
    func request<T: Decodable>(request: URLRequest, completion: @escaping ((Result<T, Error>) -> ())) {
        task = URLSession.shared.dataTask(with: request) { [weak self] in
            guard let self = self, let data = $0 else {
                guard let error = $2 else {
                    completion(.failure(MyError.unknown))
                    return
                }
                completion(.failure(error))
                return
            }
            
            do {
                completion(.success(try self.setupDecoder().decode(T.self, from: data)))
            } catch {
                completion(.failure(error))
            }
        }
        task?.resume()
    }
    
    func cancel() {
        task?.cancel()
    }
    
    private func setupDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
