//
//  AddSessionViewModel.swift
//  SwiftHeroesMVVM
//
//  Created by Mohammad Azam on 9/30/20.
//

import Foundation

class ValidationBase: ObservableObject {
    @Published var brokenRules = [BrokenRule]()
}

protocol Validatable {
    
    associatedtype ViewState
    func validate(viewState: ViewState) -> Bool
}

struct BrokenRule: Identifiable {
    let id = UUID() 
    let message: String
}

class AddSessionViewModel: ValidationBase, Validatable {
    
    func saveSession(_ sessionVS: AddSessionViewState) {
        
        // validate the input
        if validate(viewState: sessionVS) {
            // save it to the server
            let session = Session(addSessionVS: sessionVS)
            Webservice().createSession(url: Constants.Urls.createSession, session: session)
        }
    }
    
    
    // Dont worry about this...
    func validate(viewState: AddSessionViewState) -> Bool {
        // clear out the old broken rules
        brokenRules.removeAll()
        
        if viewState.title.isEmpty {
            brokenRules.append(BrokenRule(message: "Title cannot be empty!"))
        }
        if viewState.speaker.isEmpty {
            brokenRules.append(BrokenRule(message: "Speaker cannot be empty!"))
        }
        
        return brokenRules.count == 0
    }
    
    
}

struct AddSessionViewState {
    var title: String = ""
    var speaker: String = ""
}
