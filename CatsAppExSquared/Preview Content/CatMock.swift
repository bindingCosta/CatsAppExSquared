//
//  CatMock.swift
//  CatsAppExSquared
//
//  Created by Marcelo Costa on 05/02/25.
//

import Foundation

//MARK: - Cat Mock for Previews

extension Cat {
    static let mock = Cat(
        id: "0XYvRd7oD",
        url: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg",
        breeds: [
            Breed(
                id: "abys",
                name: "Abyssinian",
                temperament: "Active, Energetic, Independent, Intelligent, Gentle",
                origin: "Egypt",
                lifeSpan: "14 - 15",
                wikipediaURL: "https://en.wikipedia.org/wiki/Abyssinian_(cat)",
                weight: Breed.Weight(imperial: "7 - 10", metric: "3 - 5")
            )
        ]
    )
}
