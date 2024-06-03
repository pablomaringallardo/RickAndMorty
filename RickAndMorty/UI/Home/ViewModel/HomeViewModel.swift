//
//  HomeViewModel.swift
//  RickAndMorty
//
//  Created by Pablo Marín Gallardo on 29/4/24.
//

import Foundation
import Combine

@Observable
final class HomeViewModel {
    
    var characters: [CharacterModel] = []
    var locations: [Location]?
    var episodes: [Episode]?
    
    var interactor: HomeViewInteractorProtocol
    var suscriptors = Set<AnyCancellable>()
    
    private var currentPage = 0
    private let batchSize = 5
    var allCharacters: [CharacterModel] = []
    
    init(interactor: HomeViewInteractorProtocol = HomeViewInteractor(), suscriptors: Set<AnyCancellable> = Set<AnyCancellable>()) {
        self.interactor = interactor
        self.suscriptors = suscriptors
        self.getAllCharacter()
        self.getAllLocations()
        self.getAllEpisodes()
    }
    
    // MARK: - Characters
    
    func getAllCharacter() {
        interactor.getAllCharacter()
            .sink { completion in
                switch completion {
                case .finished:
                    print("Success get all characters")
                case .failure(let error):
                    print("ERROR: Error al traer todos los personajes \(error.localizedDescription)")
                }
            } receiveValue: { response in
                self.allCharacters = response.results
                self.loadMoreCharacters()
            }
            .store(in: &suscriptors)
    }
    
    func filterCharacters(name: String?, status: String?, species: String?, type: String?, gender: String?) {
        interactor.filterCharacter(name: name, status: status, species: species, type: type, gender: gender)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Success filter characters")
                case .failure(let error):
                    print("ERROR: Error al filtrar personajes \(error.localizedDescription)")
                }
            } receiveValue: { response in
                self.characters = response.results
            }
            .store(in: &suscriptors)
    }
    
    func loadMoreCharacters() {
        let startIndex = currentPage * batchSize
        let endIndex = min(startIndex + batchSize, allCharacters.count)
        if startIndex < endIndex {
            let newCharacters = Array(allCharacters[startIndex..<endIndex])
            characters.append(contentsOf: newCharacters)
            currentPage += 1
        }
    }
    
    // MARK: - Locations
    
    func getAllLocations() {
        interactor.getAllLocations()
            .sink { completion in
                switch completion {
                case .finished:
                    print("Succes get all locations")
                case .failure(let error):
                    print("ERROR: Error al traer las localizaciones \(error.localizedDescription)")
                }
            } receiveValue: { response in
                self.locations = response.results
            }
            .store(in: &suscriptors)
    }
    
    func filterLocations(name: String?, type: String?, dimension: String?) {
        interactor.filterLocation(name: name, type: type, dimension: dimension)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Success filter locations")
                case .failure(let error):
                    print("ERROR: Error al filtrar localizaciones \(error.localizedDescription)")
                }
            } receiveValue: { response in
                self.locations = response.results
            }
            .store(in: &suscriptors)
    }
    
    // MARK: - Episodes
    
    func getAllEpisodes() {
        interactor.getAllEpisodes()
            .sink { completion in
                switch completion {
                case .finished:
                    print("Succes get all episodes")
                case .failure(let error):
                    print("ERROR: Error al traer los episodios \(error.localizedDescription)")
                }
            } receiveValue: { response in
                self.episodes = response.results
            }
            .store(in: &suscriptors)
    }
    
    func filterEpisodes(name: String?, episode: String?) {
        interactor.filterEpisode(name: name, episode: episode)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Succes filter episodes")
                case .failure(let error):
                    print("ERROR: Error al filtrar episodios \(error.localizedDescription)")
                }
            } receiveValue: { response in
                self.episodes = response.results
            }
            .store(in: &suscriptors)
    }
}
