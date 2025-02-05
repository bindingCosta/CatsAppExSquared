//
//  CatListItemView.swift
//  CatsAppExSquared
//
//  Created by Marcelo Costa on 04/02/25.
//

import SwiftUI

struct CatListItemView: View {
    let cat: Cat

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Cat image with AsyncImage and placeholder while loading
            AsyncImage(url: URL(string: cat.url)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 360, height: 320)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 1)
                    )
            } placeholder: {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .frame(height: 320)
            }

            // Displaying the breed name of the cat, with fallback to "Unknown Breed"
            Text(cat.breeds?.first?.name ?? "Unknown Breed")
                .font(.title2)
                .fontWeight(.bold)
                .accessibilityIdentifier("CatBreedName-\(cat.id)") 

            Text(cat.breeds?.first?.origin ?? "Unknown Origin")
                .foregroundStyle(.gray)
                .accessibilityIdentifier("CatOrigin-\(cat.id)")
        }
        .padding(.horizontal)
        .accessibilityIdentifier("CatCell-\(cat.id)")
    }
}


#Preview {
    CatListItemView(cat: .mock)
}


