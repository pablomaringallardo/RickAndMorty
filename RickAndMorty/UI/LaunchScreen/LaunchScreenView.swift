//
//  LaunchScreenView.swift
//  RickAndMorty
//
//  Created by Pablo Marín Gallardo on 21/5/24.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            
            Image("RAMLogo")
            
        }
    }
}

#Preview {
    LaunchScreenView()
}
