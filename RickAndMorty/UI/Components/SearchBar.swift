//
//  SearchBar.swift
//  RickAndMorty
//
//  Created by Pablo Marín Gallardo on 21/5/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var body: some View {
        
        RoundedRectangle(cornerRadius: 10)
            .frame(height: 40)
            .padding(.horizontal, 29)
            .foregroundStyle(Color.secondaryColor)
            .overlay {
                HStack {
                    TextField(text: $text) {
                        Text("Find a character")
                            .font(.customFont(name: .nunitoRegular, size: 20))
                            .foregroundStyle(Color.primaryTextColor)
                    }
                    .font(.customFont(name: .nunitoRegular, size: 20))
                    .foregroundStyle(Color.primaryTextColor)
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(Color.secondaryTextColor)
                }
                .padding(.horizontal, 42.37)
            }
    }
}

#Preview {
    SearchBar(text: .constant(""))
}
