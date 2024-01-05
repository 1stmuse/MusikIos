//
//  SessionManager.swift
//  Musil
//
//  Created by iMuse on 31/12/2023.
//

import Foundation
import SwiftUI

class SessionManager: ObservableObject {
    
    @AppStorage("hasLoggedIn") private var hasLoggedIn: Bool = false
    
    @Published var showBottomTab: Bool = true
    
    @Published private(set) var currentState: session = .splashScreen
    
    enum session {
        case login
        case splashScreen
        case mainView
    }
    
    
    func goToMainView(){
        hasLoggedIn = true
        currentState = .mainView
    }
    
    func logOut(){
        hasLoggedIn = false
    }
    
    func loadSession(){
        if hasLoggedIn {
            currentState = .mainView
        }else {
            currentState = .login
        }
    }
    
    
    
}
