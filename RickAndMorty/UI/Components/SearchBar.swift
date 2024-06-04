//
//  SearchBar.swift
//  RickAndMorty
//
//  Created by Pablo Marín Gallardo on 21/5/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var viewModel: HomeViewModel
    @State var specieSelected: String = ""
    @State var statusSelected: String = ""
    @State var genderSelected: String = ""
    @State var typeSelected: String = ""
    @Binding var text: String
    @Binding var isPresented: Bool
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
                    
                    Button {
                        isPresented.toggle()
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .foregroundStyle(Color.secondaryTextColor)
                    }
                    .sheet(isPresented: $isPresented, content: {
                        ZStack {
                            Color.primaryColor
                                .ignoresSafeArea()
                            
                            VStack(spacing: 15) {
                                HStack {
                                    Text("Filter characters")
                                        .font(.customFont(name: .nunitoBold, size: 26))
                                        .foregroundStyle(Color.primaryTextColor)
                                        .padding(.trailing)
                                    
                                    RoundedRectangle(cornerRadius: 99)
                                        .frame(width: 100, height: 3)
                                        .foregroundStyle(Color.secondaryTextColor)
                                    
                                    
                                }
                                
                                VStack {
                                    HStack {
                                        // specie selection
                                        SelectCustom(
                                            selection: $specieSelected,
                                            sectionName: "Specie:",
                                            options: species)
                                        .onChange(of: specieSelected) {
                                            viewModel.filterCharacters(
                                                name: "",
                                                status: statusSelected,
                                                species: specieSelected,
                                                type: typeSelected,
                                                gender: genderSelected)
                                        }
                                        
                                        // status selection
                                        SelectCustom(
                                            selection: $statusSelected,
                                            sectionName: "Status:",
                                            options: status)
                                        .padding(.bottom, 40)
                                        .onChange(of: statusSelected) {
                                            viewModel.filterCharacters(
                                                name: "",
                                                status: statusSelected,
                                                species: specieSelected,
                                                type: typeSelected,
                                                gender: genderSelected)
                                        }
                                    }
                                    .padding(.horizontal)
                                    
                                    HStack {
                                        // gender selection
                                        SelectCustom(
                                            selection: $genderSelected,
                                            sectionName: "Gender:",
                                            options: gender)
                                        .onChange(of: genderSelected) {
                                            viewModel.filterCharacters(
                                                name: "",
                                                status: statusSelected,
                                                species: specieSelected,
                                                type: typeSelected,
                                                gender: genderSelected)
                                        }
                                        
                                        // type selection
                                        SelectCustom(
                                            selection: $typeSelected,
                                            sectionName: "Type:",
                                            options: type)
                                        .onChange(of: typeSelected) {
                                            viewModel.filterCharacters(
                                                name: "",
                                                status: statusSelected,
                                                species: specieSelected,
                                                type: typeSelected,
                                                gender: genderSelected)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                                
                                HStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .frame(width: 140, height: 40)
                                        .foregroundStyle(Color.backgroundColor)
                                        .overlay {
                                            Text("Reset filter")
                                                .font(.customFont(name: .nunitoBold, size: 18))
                                                .foregroundStyle(Color.primaryTextColor)
                                        }
                                        .onTapGesture {
                                            specieSelected = ""
                                            statusSelected = ""
                                            genderSelected = ""
                                            typeSelected = ""
                                            viewModel.filterCharacters(
                                                name: "",
                                                status: "",
                                                species: "",
                                                type: "",
                                                gender: "")
                                            isPresented = false
                                        }
                                }
                                .padding(.top)
                            }
                            Spacer()
                        }
                        .presentationDetents([.height(600)])
                        .presentationDragIndicator(.visible)
                    })
                    
                }
                .padding(.horizontal, 42.37)
            }
    }
}

#Preview {
    SearchBar(viewModel: .constant(HomeViewModel()), text: .constant(""), isPresented: .constant(false))
}
