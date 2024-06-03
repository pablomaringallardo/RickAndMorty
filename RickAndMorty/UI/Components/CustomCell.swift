//
//  CustomCell.swift
//  RickAndMorty
//
//  Created by Pablo Marín Gallardo on 21/5/24.
//

import SwiftUI
import CachedAsyncImage

struct CustomCell: View {
    
    var photo: String
    var name: String
    var specie: String
    var status: String
    var location: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .frame(height: 385)
            .foregroundStyle(Color.primaryColor)
            .padding(.horizontal, 29)
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.secondaryTextColor, lineWidth: 3)
                    .padding(.horizontal, 29)
                
                VStack(spacing: 0) {
                    VStack(spacing: 21) {
                        // image
                        CachedAsyncImage(
                            url: URL(string: photo)) { image in
                                image
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .clipShape(Circle())
                            } placeholder: {
                                Circle()
                                    .frame(width: 150, height: 150)
                                    .foregroundStyle(Color.secondaryColor)
                                    .overlay {
                                        Image(systemName: "photo")
                                            .resizable()
                                            .frame(width: 80, height: 60)
                                            .foregroundStyle(Color.secondaryTextColor)
                                    }
                            }
                        
                        // name
                        
                        Text(name)
                            .font(.customFont(name: .nunitoBold, size: 25))
                            .foregroundStyle(Color.secondaryTextColor)
                        // specie
                        
                        Text(specie)
                            .font(.customFont(name: .nunitoMedium, size: 20))
                            .foregroundStyle(Color.primaryTextColor)
                    }
                    .offset(y: -10)
                    
                    // location
                    
                    switch status {
                    case "Alive":
                        Text("You can find me in \(location)")
                            .font(.customFont(name: .nunitoMedium, size: 20))
                            .foregroundStyle(Color.primaryTextColor)
                            .frame(maxWidth: 159)
                            .multilineTextAlignment(.center)
                        
                    case "unknown":
                        Text("Maybe you can find me on \(location)")
                            .font(.customFont(name: .nunitoMedium, size: 20))
                            .foregroundStyle(Color.primaryTextColor)
                            .frame(maxWidth: 159, maxHeight: 180)
                            .multilineTextAlignment(.center)
                        
                    case "Dead":
                        Text("You can't find me because I'm dead")
                            .font(.customFont(name: .nunitoMedium, size: 20))
                            .foregroundStyle(Color.primaryTextColor)
                            .frame(maxWidth: 159)
                            .multilineTextAlignment(.center)
                        
                    default:
                        Text("")
                    }
                    Spacer()
                }
            }
    }
}

#Preview {
    CustomCell(
        photo: "https://rickandmortyapi.com/api/character/avatar/7.jpeg",
        name: "Abradolf Lincler",
        specie: "Human",
        status: "unknown",
        location: "Testicle Monster Dimension")
}
