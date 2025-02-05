//
//  URLSessionProtocol.swift
//  CatsAppExSquared
//
//  Created by Marcelo Costa on 06/02/25.
//

import Foundation

protocol URLSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}

// Mock session to simulate an invalid URL scenario
class MockInvalidURLSession: URLSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        throw NetworkError.invalidURL
    }
}

