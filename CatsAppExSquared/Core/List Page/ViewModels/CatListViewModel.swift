//
//  CatListViewModel.swift
//  CatsAppExSquared
//
//  Created by Marcelo Costa on 04/02/25.
//

import Foundation

@MainActor
class CatListViewModel: ObservableObject {
    @Published var cats: [Cat] = []
    @Published var currentPage: Int = 1
    @Published var isLoading: Bool = false
    @Published var error: Error?
    
    private let catService: CatServiceProtocol
    
    init(catService: CatServiceProtocol = CatService()) {
        self.catService = catService
    }
    
    // Fetch cats for the current page
    private func fetchCats(page: Int) async {
        guard !isLoading else { return } /// Prevent duplicate requests
        isLoading = true
        error = nil
        
        do {
            let fetchedCats = try await catService.fetchCats(page: page)
            self.cats.append(contentsOf: fetchedCats)
        } catch {
            self.error = error
            print("Error fetching cats: \(error)")
        }
        
        isLoading = false
    }
    
    // Initial fetch of cats for the first page
    func fetchCats() async {
        await fetchCats(page: currentPage)
    }
    
    // Load more cats (pagination)
    func loadMoreCats() async {
        currentPage += 1
        await fetchCats(page: currentPage)
    }
}
