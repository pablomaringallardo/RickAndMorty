//
//  Character.swift
//  RickAndMorty
//
//  Created by Pablo Marín Gallardo on 29/4/24.
//

import Foundation

struct APIResponseCharacterModel: Codable {
    let results: [CharacterModel]
}

struct CharacterModel: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: [String:String]
    let location: [String:String]
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
