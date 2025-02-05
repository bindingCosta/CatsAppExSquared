//
//  CatModel.swift
//  CatsApp-ExSquared
//
//  Created by Marcelo Costa on 03/02/25.
//

import Foundation

struct Cat: Identifiable, Codable, Equatable {
    let id: String
    let url: String
    let breeds: [Breed]?
    
    static func ==(lhs: Cat, rhs: Cat) -> Bool {
        return lhs.id == rhs.id
    }
    
    /// Note: We could also add a Country Code to the model (it would help to a future search feature).
    struct Breed: Codable {
        let id: String
        let name: String
        let temperament: String
        let origin: String
        let lifeSpan: String
        let wikipediaURL: String?
        let weight: Weight

        struct Weight: Codable {
            /// Weight in imperial units (pounds).
            let imperial: String
            /// Weight in metric units (Kg).
            let metric: String
        }

        /// Coding keys to map JSON keys to Swift properties.
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case temperament
            case origin
            case lifeSpan = "life_span"
            case wikipediaURL = "wikipedia_url"
            case weight
        }
    }
}



