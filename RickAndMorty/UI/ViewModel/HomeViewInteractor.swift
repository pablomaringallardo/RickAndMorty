//
//  HomeViewInteractor.swift
//  RickAndMorty
//
//  Created by Pablo Marín Gallardo on 29/4/24.
//

import Foundation
import Combine

protocol HomeViewInteractorProtocol: AnyObject {
    func getAllCharacter() -> AnyPublisher<ResponseAllCharacter, Error>
    func filterCharacter(name: String?, status: String?, species: String?, type: String?, gender: String?) -> AnyPublisher<ResponseAllCharacter, Error>
}

final class HomeViewInteractor: HomeViewInteractorProtocol {
    
    let networker = Networker()
    let networkManager = NetworkManager()
    
    func getAllCharacter() -> AnyPublisher<ResponseAllCharacter, any Error> {
        
        let endpoint = "/character"
        
        return networker.callServer(type: ResponseAllCharacter.self, request: networkManager.getSession(endpoint: endpoint)!)
    }
    
    func filterCharacter(name: String?, status: String?, species: String?, type: String?, gender: String?) -> AnyPublisher<ResponseAllCharacter, Error> {
        
        let endpoint = "/character/?name=\(name ?? "")&status=\(status ?? "")&species=\(species ?? "")&type=\(type ?? "")&gender=\(gender ?? "")"
        
        return networker.callServer(type: ResponseAllCharacter.self, request: networkManager.getSession(endpoint: endpoint)!)
    }
}
