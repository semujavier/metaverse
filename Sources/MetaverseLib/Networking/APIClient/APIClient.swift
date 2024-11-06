//
//  APIClient.swift
//  MetaverseLib
//
//  Created by Javier Serrano Muñoz on 5/11/24.
//

import Foundation


final class APIClient: Sendable {
    private let session: URLSession
    private let retryCount: Int = 5
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request(_ apiRequest: APIRequest) async throws -> Data {
        let url = apiRequest.baseURL.appendingPathComponent(apiRequest.endpoint)
        var request = URLRequest(url: url)
        request.httpMethod = apiRequest.method.rawValue
        
        if apiRequest.headers != nil {
            request.allHTTPHeaderFields = apiRequest.headers
        }
        
        if apiRequest.body != nil {
            request.httpBody = apiRequest.body
        }
        
      
        print("Fetching response for: \(apiRequest.id)")
        
        for tryNumber in 0 ..< retryCount + 1 {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let response = response as? HTTPURLResponse else {
                throw APIClientError.invalidResponse
            }
            
            if 200..<300 ~= response.statusCode {
                print("Received response from: \(apiRequest.id)")
                return data
            } else {
                print("Error in \(apiRequest.id): \(response.statusCode). Retries left: \(retryCount - tryNumber)")
                try? await Task.sleep(for: .milliseconds(500))
            }
            
        }
        
        throw APIClientError.noRetriesLeft
    }
    
    func requestDecodable<T: Decodable>(_ apiRequest: APIRequest) async throws -> T {
        let data = try await request(apiRequest)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
