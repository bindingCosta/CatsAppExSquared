//
//  CatListView.swift
//  CatsAppExSquared
//
//  Created by Marcelo Costa on 04/02/25.
//

import SwiftUI

struct CatListView: View {
    @StateObject private var viewModel = CatListViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                //MARK: Main LazyVStack Elements
                LazyVStack {
                    //MARK: - Cats List
                    ForEach(viewModel.cats) { cat in
                        NavigationLink(destination: CatDetailView(cat: cat)
                            .navigationBarBackButtonHidden()) {
                            CatListItemView(cat: cat)
                                .frame(height: 400)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        .buttonStyle(.plain)
                        .accessibilityIdentifier("CatCell-\(cat.id)") 
                        /// Detect when the last cat appears and trigger loading more
                        .onAppear {
                            if cat == viewModel.cats.last {
                                Task {
                                    await viewModel.loadMoreCats()
                                }
                            }
                        }
                    }
                    
                    //MARK: - Load More Button (This was my first idea for pagination)
                    if !viewModel.isLoading && !viewModel.cats.isEmpty {
                        Button(action: {
                            Task {
                                await viewModel.loadMoreCats()
                            }
                        }) {
                            Text("Load More Cats")
                                .font(.headline)
                                .padding()
                                .background(Capsule().fill(Color.blue))
                                .foregroundColor(.white)
                        }
                    } else if viewModel.isLoading {
                        ProgressView()
                            .padding()
                    }
                }
                .navigationTitle("The Cats App")
            }
            
            //MARK: - Error Alert
            .task {
                await viewModel.fetchCats()
            }
            .alert("Error", isPresented: Binding<Bool>(
                get: { viewModel.error != nil },
                set: { _ in viewModel.error = nil }
            )) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(viewModel.error?.localizedDescription ?? "Unknown Error")
            }
        }
    }
}

#Preview {
    CatListView()
}
