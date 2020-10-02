//
//  Webservice.swift
//  SwiftHeroesMVVM
//
//  Created by Mohammad Azam on 9/28/20.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case decodingError
    case noData
}

class Webservice {
    
    func createSession(url: String, session: Session) {
        
        // create the session and return the completion handler 
        
    }
    
    func getAllSessions(url: String, completion: @escaping (Result<[Session]?, NetworkError>) -> Void) {
        
        guard let conferenceURL = URL(string: url)  else {
            completion(.failure(.badUrl))
            return
        }
        
        URLSession.shared.dataTask(with: conferenceURL) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            let sessions = try? JSONDecoder().decode([Session].self, from: data)
            completion(.success(sessions))
            
        }.resume()
        
    }
    
}
