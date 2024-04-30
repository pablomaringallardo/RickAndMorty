//
//  Episode.swift
//  RickAndMorty
//
//  Created by Pablo Marín Gallardo on 30/4/24.
//

import Foundation

struct APIResponseEpisodeModel: Codable {
    let results: [Episode]
}

struct Episode: Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
