//
//  BottomTabs.swift
//  Musil
//
//  Created by iMuse on 31/12/2023.
//

import SwiftUI

struct BottomTabView: View {
    
    @EnvironmentObject private var sessionManager: SessionManager
    @State private var selectedTab: Tabs = .Home
    
    var body: some View {
        VStack(){
            ZStack {
                Color.red
                    .opacity(selectedTab == .Home ? 1.0 : 0.0)
                    .ignoresSafeArea()
                Color.green
                    .opacity(selectedTab == .Explore ? 1.0 : 0.0)
                    .ignoresSafeArea()
            }
           
//            Spacer()
            CustomView(selectedTab: $selectedTab)
            
        }
        .background(Color.background)
        .onAppear{
//            sessionManager.logOut()
        }

        
    }
}

struct BottomTabView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabView()
            .environmentObject(SessionManager())
    }
}
