//
//  AddSessionView.swift
//  SwiftHeroesMVVM
//
//  Created by Mohammad Azam on 9/30/20.
//

import SwiftUI

struct AddSessionView: View {
    
    @ObservedObject private var addSessionViewModel = AddSessionViewModel()
    @State private var addSessionViewState = AddSessionViewState()
   
    
    var body: some View {
        Form {
            Section(header: EmptyView()) {
                TextField("Title", text: $addSessionViewState.title)
                TextField("Speaker", text: $addSessionViewState.speaker)
            }
            
            ForEach(addSessionViewModel.brokenRules, id: \.id) { brokenRule in
                Text(brokenRule.message)
            }
            
        }
        .navigationBarItems(trailing: Button("Save") {
            // save the view state
            addSessionViewModel.saveSession(addSessionViewState)
        })
        .navigationTitle("Add Session")
        .embedInNavigationView()
    }
}

struct AddSessionView_Previews: PreviewProvider {
    static var previews: some View {
        AddSessionView()
    }
}
