//
//  CatService.swift
//  CatsAppExSquared
//
//  Created by Marcelo Costa on 03/02/25.
//

import Foundation

//MARK: -  Protocol defining the contract for fetching cat data.
protocol CatServiceProtocol {
    /// - Parameter page: The page number for pagination.
    /// - Returns: An array of `Cat` objects.
    /// - Throws: `NetworkError` if the request fails.
    func fetchCats(page: Int) async throws -> [Cat]
}

/// Service responsible for fetching cat data from The Cat API.
final class CatService: CatServiceProtocol {
    
    // Base API URL
    private let baseURL = "https://api.thecatapi.com/v1/images/search"
    
    // My Free API Key
    private let apiKey = "live_Buj3fEd0cZrK5CBoNW9hXNWVD7qn0krfOcIW5LnOjYwV3cgWIHNlrXwvBTvXsZN1"
    
    private let session: URLSessionProtocol
    
    // Initializer to inject URLSession for testing purposes
    init(session: URLSessionProtocol = URLSession.shared as URLSessionProtocol) {
        self.session = session
    }
    
    /// Fetches cats from The Cat API.
    /// - Parameter page: The page number for pagination.
    /// - Returns: A list of `Cat` objects.
    /// - Throws: `NetworkError.invalidURL` if the URL is malformed.
    ///           `NetworkError.decodingError` if data decoding fails.
    func fetchCats(page: Int) async throws -> [Cat] {
        let urlString = "\(baseURL)?limit=10&has_breeds=1&page=\(page)"
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        
        do {
            let (data, response) = try await session.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw NetworkError.invalidResponse
            }
            
            return try JSONDecoder().decode([Cat].self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }
}

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}
