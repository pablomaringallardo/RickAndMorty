//
//  HomeView.swift
//  RickAndMorty
//
//  Created by Pablo Marín Gallardo on 29/4/24.
//

import SwiftUI

struct HomeView: View {
    @State var viewModel = HomeViewModel()
    @State var textSearchBar: String = ""
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 30) {
                    Image("RAMLogo")
                    
                    SearchBar(text: $textSearchBar)
                        .onChange(of: textSearchBar) { _, newValue in
                            if !textSearchBar.isEmpty {
                                viewModel.filterCharacters(
                                    name: newValue,
                                    status: "",
                                    species: "",
                                    type: "",
                                    gender: "")
                            } else {
                                viewModel.getAllCharacter()
                            }
                        }
                    
                    HStack {
                        Text("Characters")
                            .font(.customFont(name: .nunitoBold, size: 28))
                            .foregroundStyle(Color.primaryTextColor)
                            .padding(.trailing)
                        
                        RoundedRectangle(cornerRadius: 99)
                            .frame(height: 3)
                            .foregroundStyle(Color.secondaryTextColor)
                    }
                    .padding(.horizontal, 29)
                    
                    ForEach(viewModel.characters) { character in
                        CustomCell(
                            photo: character.image,
                            name: character.name,
                            specie: character.species,
                            status: character.status,
                            location: character.location["name"] ?? "")
                    }
                    
                    if viewModel.characters.count < viewModel.allCharacters.count {
                        Button(action: {
                            viewModel.loadMoreCharacters()
                        }) {
                            LoadMoreButton()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
