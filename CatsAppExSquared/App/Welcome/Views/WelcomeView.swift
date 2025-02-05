//
//  WelcomeView.swift
//  CatsApp-ExSquared
//
//  Created by Marcelo Costa on 04/02/25.
//

import SwiftUI

struct WelcomeView: View {
    @StateObject private var viewModel = WelcomeViewModel()

    var body: some View {
        
        //MARK: - Header
        NavigationStack {
            VStack(alignment: .leading, spacing: 30) {
                Text("Welcome to CatsApp!")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("This is a simple app that shows a list of cats and their details.\nYou can navigate through the list of cats and see more details about each one.")
                    .foregroundStyle(.gray)
                

                //MARK: - First Carousel
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(viewModel.catImages, id: \.self) { imageUrl in
                            AsyncImage(url: URL(string: imageUrl)) { image in
                                image.resizable()
                                    .scaledToFill()
                                    .frame(width: 150, height: 150)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .shadow(radius: 4)
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 150, height: 150)
                            }
                        }
                    }
                    .padding(.vertical)
                }
                .frame(height: 160)

                //MARK: - Second Carousel (Reversed Direction)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(viewModel.catImages, id: \.self) { imageUrl in
                            AsyncImage(url: URL(string: imageUrl)) { image in
                                image.resizable()
                                    .scaledToFill()
                                    .frame(width: 150, height: 150)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .shadow(radius: 4)
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 150, height: 150)
                            }
                        }
                    }
                    .padding(.vertical)
                    .scaleEffect(x: -1)
                }
                .frame(height: 160)

                NavigationLink(destination: CatListView()
                    .navigationBarBackButtonHidden()
                ) {
                    Text("See Cats")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
            .padding()
            .task {
                await viewModel.fetchCatImages()
            }
        }
    }
}

#Preview {
    WelcomeView()
}
