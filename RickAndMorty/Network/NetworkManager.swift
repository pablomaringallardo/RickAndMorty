//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Pablo Marín Gallardo on 29/4/24.
//

import Foundation

struct NetworkManager {
    
    func getSession(endpoint: String) -> URLRequest? {
        
        let urlComponents = URLComponents(string: "\(baseURL)\(endpoint)")
        
        guard let url = urlComponents?.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = HttpMethods.get.rawValue
        
        return request
    }
}
