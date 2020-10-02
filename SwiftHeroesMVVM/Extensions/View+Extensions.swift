//
//  View+Extensions.swift
//  SwiftHeroesMVVM
//
//  Created by Mohammad Azam on 9/28/20.
//

import Foundation
import SwiftUI

extension View {
    
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
    
}
