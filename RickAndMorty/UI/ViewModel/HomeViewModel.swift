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
    
    var interactor: HomeViewInteractorProtocol
    var suscriptors = Set<AnyCancellable>()
    
    init(interactor: HomeViewInteractorProtocol = HomeViewInteractor(), suscriptors: Set<AnyCancellable> = Set<AnyCancellable>()) {
        self.interactor = interactor
        self.suscriptors = suscriptors
    }
    
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
}
