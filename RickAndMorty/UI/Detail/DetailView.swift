//
//  DetailView.swift
//  RickAndMorty
//
//  Created by Pablo Marín Gallardo on 30/4/24.
//

import SwiftUI
import CachedAsyncImage

struct DetailView: View {
    var name: String
    var status: String
    var species: String
    var gender: String
    var image: String
    
    var viewModel: HomeViewModel
    var body: some View {
        
        VStack {
            CachedAsyncImage(
                url: URL(string: image)) { image in
                    image
                        .clipShape(Circle())
                } placeholder: {
                    Circle()
                        .overlay {
                            Image(systemName: "photo")
                        }
                }
            
            Text(name)
                .font(.largeTitle)
                .bold()
        }
    }
}

#Preview {
    DetailView(name: "Rick Sanchez", status: "Alive", species: "Human", gender: "Male", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", viewModel: HomeViewModel())
}
