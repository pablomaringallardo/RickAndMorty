//
//  LoadMoreButton.swift
//  RickAndMorty
//
//  Created by Pablo Marín Gallardo on 3/6/24.
//

import SwiftUI

struct LoadMoreButton: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .frame(height: 80)
            .foregroundStyle(Color.primaryColor)
            .padding(.horizontal, 50)
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.secondaryTextColor, lineWidth: 3)
                    .padding(.horizontal, 50)
                
                Text("Load More")
                    .font(.customFont(name: .nunitoBold, size: 32))
                    .foregroundStyle(Color.secondaryTextColor)
            }
    }
}

#Preview {
    LoadMoreButton()
}
