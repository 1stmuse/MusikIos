//
//  ContentView.swift
//  Musil
//
//  Created by iMuse on 30/12/2023.
//

import SwiftUI

struct MainApp: View {
    
    @EnvironmentObject private var sessionManager: SessionManager
    
//    @ObservedObject private var sessionManager = SessionManager()
    
    var body: some View {
        ZStack {
            SplashScreen()
                .opacity(sessionManager.currentState == .splashScreen ? 1 : 0)
                .animation(.easeIn, value: sessionManager.currentState)
            
            LoginView()
                .opacity(sessionManager.currentState == .login ? 1 : 0)
                .animation(.easeIn, value: sessionManager.currentState)
            
            BottomTabView()
                .opacity(sessionManager.currentState == .mainView ? 1 : 0)
                .animation(.easeIn, value: sessionManager.currentState)
        }
        .onAppear{
            withAnimation {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                    sessionManager.loadSession()
                }
            }
        }
       
    }
}

struct MainApp_Previews: PreviewProvider {
    static var previews: some View {
        MainApp()
            .environmentObject(SessionManager())
    }
}
