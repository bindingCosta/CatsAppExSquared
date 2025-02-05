//
//  CatDetailsView.swift
//  CatsAppExSquared
//
//  Created by Marcelo Costa on 03/02/25.
//

import SwiftUI

struct CatDetailView: View {
    let cat: Cat
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ScrollView {
            // MARK: - Cat's Image and Dismiss Button
            ZStack(alignment: .topLeading) {
                // Cat's Image
                AsyncImage(url: URL(string: cat.url)) { image in
                    image.resizable()
                         .scaledToFill()
                         .frame(width: UIScreen.main.bounds.width, height: 320)
                         .clipped()
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        .frame(width: UIScreen.main.bounds.width, height: 320)
                }
                
                // Dismiss Button
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(45)
                }
            }
            
            // MARK: - Cat's Details
            VStack(alignment: .leading, spacing: 16) {
                if let breed = cat.breeds?.first {
                    BreedDetailView(breed: breed)
                } else {
                    Text("No breed information available")
                        .foregroundStyle(.gray)
                }
            }
            .padding()
        }
        .ignoresSafeArea(edges: .top)
    }
}

//MARK: - Struct for Breed Details
struct BreedDetailView: View {
    let breed: Cat.Breed

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Breed: \(breed.name)")
                .font(.title2)
                .fontWeight(.bold)
            
            Text("Origin: \(breed.origin)")
                .font(.headline)
                .foregroundStyle(.gray)
            
            Text("Temperament: \(breed.temperament)")
                .font(.subheadline)
                .fontWeight(.medium)
            
            Text("Life Span: \(breed.lifeSpan) years")
                .font(.subheadline)
                .fontWeight(.medium)
            
            Text("Weight: \(breed.weight.imperial) lbs / \(breed.weight.metric) kg")
                .font(.subheadline)
                .fontWeight(.medium)
            
            // Wikipedia Link
            if let wikipediaURL = breed.wikipediaURL, let url = URL(string: wikipediaURL) {
                Link(destination: url) {
                    Text("Learn more on Wikipedia")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .clipShape(Capsule())
                }
                .padding(.top, 8)
            }
        }
    }
}

#Preview {
    CatDetailView(cat: Cat.mock)
}
