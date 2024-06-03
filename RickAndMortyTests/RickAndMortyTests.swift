//
//  RickAndMortyTests.swift
//  RickAndMortyTests
//
//  Created by Pablo Marín Gallardo on 29/4/24.
//

import XCTest
@testable import RickAndMorty

final class RickAndMortyTests: XCTestCase {

    func testCharacterInitialization() {
        
        let id = 1
        let name = "name"
        let status = "status"
        let species = "species"
        let type = "type"
        let gender = "gender"
        let origin = ["key":"value"]
        let location = ["key":"value"]
        let image = "image"
        let episode = ["episode"]
        let url = "url"
        let created = "created"
        
        let character = CharacterModel(
            id: id,
            name: name,
            status: status,
            species: species,
            type: type,
            gender: gender,
            origin: origin,
            location: location,
            image: image,
            episode: episode,
            url: url,
            created: created)
        
        XCTAssertEqual(character.id, id)
        XCTAssertEqual(character.name, name)
        XCTAssertEqual(character.status, status)
        XCTAssertEqual(character.species, species)
        XCTAssertEqual(character.type, type)
        XCTAssertEqual(character.gender, gender)
        XCTAssertEqual(character.origin, origin)
        XCTAssertEqual(character.location, location)
        XCTAssertEqual(character.image, image)
        XCTAssertEqual(character.episode, episode)
        XCTAssertEqual(character.url, url)
        XCTAssertEqual(character.created, created)
    }
    
    func testLocationInitialization() {
        
        let id = 1
        let name = "name"
        let type = "type"
        let dimension = "dimension"
        let residents = ["residents"]
        let url = "url"
        let created = "created"
        
        let location = Location(
            id: id,
            name: name,
            type: type,
            dimension: dimension,
            residents: residents,
            url: url,
            created: created)
        
        XCTAssertEqual(location.id, id)
        XCTAssertEqual(location.name, name)
        XCTAssertEqual(location.type, type)
        XCTAssertEqual(location.dimension, dimension)
        XCTAssertEqual(location.residents, residents)
        XCTAssertEqual(location.url, url)
        XCTAssertEqual(location.created, created)
    }
    
    func testEpisodeInitialization() {
        
        let id = 1
        let name = "name"
        let airDate = "airDate"
        let episode = "episode"
        let characters = ["characters"]
        let url = "url"
        let created = "created"
        
        let episodeModel = Episode(
            id: id,
            name: name,
            air_date: airDate,
            episode: episode,
            characters: characters,
            url: url,
            created: created)
        
        XCTAssertEqual(episodeModel.id, id)
        XCTAssertEqual(episodeModel.name, name)
        XCTAssertEqual(episodeModel.air_date, airDate)
        XCTAssertEqual(episodeModel.episode, episode)
        XCTAssertEqual(episodeModel.characters, characters)
        XCTAssertEqual(episodeModel.url, url)
        XCTAssertEqual(episodeModel.created, created)
    }
}
