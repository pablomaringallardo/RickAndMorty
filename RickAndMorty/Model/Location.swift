//
//  Location.swift
//  RickAndMorty
//
//  Created by Pablo Marín Gallardo on 30/4/24.
//

import Foundation

struct APIResponseLocationModel: Codable {
    let results: [Location]
}

struct Location: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
