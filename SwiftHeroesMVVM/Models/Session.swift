//
//  Session.swift
//  SwiftHeroesMVVM
//
//  Created by Mohammad Azam on 9/28/20.
//

import Foundation

struct Session: Codable {
    let title: String
    let speaker: String 
}

extension Session {
    
    init(addSessionVS: AddSessionViewState) {
        self.title = addSessionVS.title
        self.speaker = addSessionVS.speaker
    }
    
}
