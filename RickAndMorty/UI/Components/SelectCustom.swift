//
//  SelectCustom.swift
//  RickAndMorty
//
//  Created by Pablo Marín Gallardo on 4/6/24.
//

import SwiftUI

struct SelectCustom: View {
    @Binding var selection: String
    var sectionName: String
    var options: [String]
    var body: some View {
        VStack(spacing: 10) {
            Text(sectionName)
                .font(.customFont(name: .nunitoBold, size: 24))
                .foregroundStyle(Color.primaryTextColor)
            
            VStack(alignment: .leading, spacing: 2) {
                ForEach(options, id: \.self) { option in
                    
                    HStack {
                        Text(option)
                            .font(.customFont(name: .nunitoRegular, size: 20))
                            .foregroundStyle(selection == option ? Color.secondaryTextColor : Color.primaryTextColor)
                            .frame(maxHeight: 40)
                        
                        Spacer()
                        
                        if selection == option {
                            Image(systemName: "checkmark")
                                .font(.subheadline)
                                .foregroundStyle(selection == option ? Color.secondaryTextColor : Color.primaryTextColor)
                                .padding(.trailing)
                        }
                    }
                    .onTapGesture {
                        withAnimation {
                            selection = option
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ZStack {
        Color.primaryColor
        
        SelectCustom(selection: .constant(""), sectionName: "Specie:", options: ["Human", "Alien", "Robot"])
    }
}
