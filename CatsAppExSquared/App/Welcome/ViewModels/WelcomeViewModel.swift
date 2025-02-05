//
//  WelcomeViewModel.swift
//  CatsAppExSquared
//
//  Created by Marcelo Costa on 04/02/25.
//

import SwiftUI

@MainActor
class WelcomeViewModel: ObservableObject {
    /// Array of cat image URLs.
    @Published var catImages: [String] = []
    
    /// An optional error that can be displayed if the data fetching fails.
    @Published var error: Error? = nil
    
    @Published var isNavigatingToCatsList: Bool = false
    
    /// Fetches cat images from the API.
    func fetchCatImages() async {
        let urlString = "https://api.thecatapi.com/v1/images/search?limit=15"
        
        guard let url = URL(string: urlString) else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let cats = try JSONDecoder().decode([CatImageResponse].self, from: data)
            self.catImages = cats.map { $0.url }
        } catch {
            self.error = error
            print("Failed to load cat images: \(error)")
        }
    }
    
    /// Starts the navigation to the cats list
    func startNavigation() {
        isNavigatingToCatsList = true
    }
}

struct CatImageResponse: Codable {
    let url: String
}
