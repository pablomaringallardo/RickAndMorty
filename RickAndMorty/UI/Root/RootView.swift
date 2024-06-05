//
//  RootView.swift
//  RickAndMorty
//
//  Created by Pablo Marín Gallardo on 5/6/24.
//

import SwiftUI

struct RootView: View {
    
    @State var selectedTab: Int = 0
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            HomeView()
                .tag(0)
            
            LocationsView()
                .tag(1)
            
            EpisodesView()
                .tag(2)
        }
        .overlay(alignment: .bottom) {
            TabBarView(selectedTab: $selectedTab)
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    RootView()
}
