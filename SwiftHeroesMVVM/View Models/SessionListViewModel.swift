//
//  SessionListViewModel.swift
//  SwiftHeroesMVVM
//
//  Created by Mohammad Azam on 9/28/20.
//

import Foundation

class SessionListViewModel: ObservableObject {
    
    @Published var sessions = [SessionViewModel]()
    private var webservice: Webservice
    
    init() {
        webservice = Webservice()
    }
    
    func getAllSessions() {
        
        webservice.getAllSessions(url: Constants.Urls.sessions) { result in
            
            switch result {
            case .success(let sessions):
                if let sessions = sessions {
                    DispatchQueue.main.async {
                        self.sessions = sessions.map(SessionViewModel.init)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
}

// SessionViewModel to represent an individual session
struct SessionViewModel {
    
    private (set) var session: Session
    
    init(session: Session) {
        self.session = session
    }
    
    var title: String {
        session.title.capitalized
    }
    
    var speaker: String {
        session.speaker
    }
    
}

