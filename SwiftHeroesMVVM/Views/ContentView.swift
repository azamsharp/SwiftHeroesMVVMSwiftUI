//
//  ContentView.swift
//  SwiftHeroesMVVM
//
//  Created by Mohammad Azam on 9/28/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var sessionListVM = SessionListViewModel()
    @State private var isPresented: Bool = false
    
    var body: some View {
        
        VStack {
           
            List(sessionListVM.sessions, id: \.title) { session in
                VStack(alignment: .leading, spacing: 10) {
                    Text(session.title)
                        .font(.headline)
                    
                    Text(session.speaker)
                        .opacity(0.8)
                }
            }.listStyle(PlainListStyle())
            
            .onAppear {
                // get all sessions
                sessionListVM.getAllSessions()
            }
        }
        .navigationBarItems(trailing: Button("Add Session") {
            isPresented = true
        })
        .navigationTitle("Swift Heroes")
        .embedInNavigationView()
        
        .sheet(isPresented: $isPresented) {
            AddSessionView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
