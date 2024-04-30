//
//  HomeViewInteractor.swift
//  RickAndMorty
//
//  Created by Pablo Marín Gallardo on 29/4/24.
//

import Foundation
import Combine

protocol HomeViewInteractorProtocol: AnyObject {
    func getAllCharacter() -> AnyPublisher<APIResponseCharacterModel, Error>
    func filterCharacter(name: String?, status: String?, species: String?, type: String?, gender: String?) -> AnyPublisher<APIResponseCharacterModel, Error>
    func getAllLocations() -> AnyPublisher<APIResponseLocationModel, Error>
    func filterLocation(name: String?, type: String?, dimension: String?) -> AnyPublisher<APIResponseLocationModel, Error>
    func getAllEpisodes() -> AnyPublisher<APIResponseEpisodeModel, Error>
    func filterEpisode(name: String?, episode: String?) -> AnyPublisher<APIResponseEpisodeModel, Error>
}

final class HomeViewInteractor: HomeViewInteractorProtocol {
    
    let networker = Networker()
    let networkManager = NetworkManager()
    
    // MARK: -CHARACTERS
    
    func getAllCharacter() -> AnyPublisher<APIResponseCharacterModel, any Error> {
        
        let endpoint = "/character"
        
        return networker.callServer(type: APIResponseCharacterModel.self, request: networkManager.getSession(endpoint: endpoint)!)
    }
    
    func filterCharacter(name: String?, status: String?, species: String?, type: String?, gender: String?) -> AnyPublisher<APIResponseCharacterModel, Error> {
        
        let endpoint = "/character/?name=\(name ?? "")&status=\(status ?? "")&species=\(species ?? "")&type=\(type ?? "")&gender=\(gender ?? "")"
        
        return networker.callServer(type: APIResponseCharacterModel.self, request: networkManager.getSession(endpoint: endpoint)!)
    }
    
    // MARK: -LOCATIONS
    
    func getAllLocations() -> AnyPublisher<APIResponseLocationModel, any Error> {
        
        let endpoint = "/location"
        
        return networker.callServer(type: APIResponseLocationModel.self, request: networkManager.getSession(endpoint: endpoint)!)
    }
    
    func filterLocation(name: String?, type: String?, dimension: String?) -> AnyPublisher<APIResponseLocationModel, any Error> {
        
        let endpoint = "/location?name=\(name ?? "")&type=\(type ?? "")&dimension=\(dimension ?? "")"
        
        return networker.callServer(type: APIResponseLocationModel.self, request: networkManager.getSession(endpoint: endpoint)!)
    }
    
    // MARK: -EPISODES
    
    func getAllEpisodes() -> AnyPublisher<APIResponseEpisodeModel, any Error> {
        
        let endpoint = "/episode"
        
        return networker.callServer(type: APIResponseEpisodeModel.self, request: networkManager.getSession(endpoint: endpoint)!)
    }
    
    func filterEpisode(name: String?, episode: String?) -> AnyPublisher<APIResponseEpisodeModel, any Error> {
        
        let endpoint = "/episode?name=\(name ?? "")&episode=\(episode ?? "")"
        
        return networker.callServer(type: APIResponseEpisodeModel.self, request: networkManager.getSession(endpoint: endpoint)!)
    }
}
