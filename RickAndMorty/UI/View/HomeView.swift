//
//  HomeView.swift
//  RickAndMorty
//
//  Created by Pablo Marín Gallardo on 29/4/24.
//

import SwiftUI

struct HomeView: View {
    var viewModel = HomeViewModel()
    var body: some View {
        Button {
            viewModel.filterCharacters(name: "", status: "alive", species: "", type: "", gender: "")
        } label: {
            Text("Boton")
        }
        
        Text("\(viewModel.characters?.count ?? 0)")
    }
}

#Preview {
    HomeView()
}
