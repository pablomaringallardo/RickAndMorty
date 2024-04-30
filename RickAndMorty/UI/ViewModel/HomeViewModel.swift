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
    
    var characters: [Character]?
    var locations: [Location]?
    var episodes: [Episode]?
    
    var interactor: HomeViewInteractorProtocol
    var suscriptors = Set<AnyCancellable>()
    
    init(interactor: HomeViewInteractorProtocol = HomeViewInteractor(), suscriptors: Set<AnyCancellable> = Set<AnyCancellable>()) {
        self.interactor = interactor
        self.suscriptors = suscriptors
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
                self.characters = response.results
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
