//
//  TabBarView.swift
//  RickAndMorty
//
//  Created by Pablo Marín Gallardo on 5/6/24.
//

import SwiftUI

struct TabBarView: View {
    
    @Binding var selectedTab: Int
    
    var tabBarItems: [(image: Image, title: String)] = [
        (Image(systemName: "person.3.fill"), "Characters"),
        (Image(systemName: "location.circle.fill"), "Locations"),
        (Image(systemName: "film"), "Episodes")
    ]
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 90)
                .foregroundStyle(Color.backgroundColor)
                .overlay(alignment: .top) {
                    Rectangle()
                        .frame(height: 3)
                        .foregroundStyle(Color.secondaryTextColor)
                }
            
            HStack(spacing: 34) {
                ForEach(0...2, id: \.self) { i in
                    
                    Button {
                        selectedTab = i
                    } label: {
                        VStack {
                            tabBarItems[i].image
                                .font(.title)
                                .foregroundStyle(selectedTab == i ? Color.secondaryTextColor : Color.secondaryColor)
                            
                            Text(tabBarItems[i].title)
                                .font(.customFont(
                                    name: .nunitoMedium,
                                    size: 20))
                                .foregroundStyle(selectedTab == i ? Color.secondaryTextColor : Color.secondaryColor)
                        }
                    }
                }
            }
            
        }
    }
}

#Preview {
    TabBarView(selectedTab: .constant(0))
}
