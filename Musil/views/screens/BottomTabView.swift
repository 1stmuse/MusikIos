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
        ZStack(alignment:.bottom){
            ZStack {
                HomeView()
                    .opacity(selectedTab == .Home ? 1.0 : 0.0)
                    .ignoresSafeArea()
                Color.green
                    .opacity(selectedTab == .Explore ? 1.0 : 0.0)
                    .ignoresSafeArea()
            }
           
            CustomView(selectedTab: $selectedTab)
            
        }
        .ignoresSafeArea()
        .background(Color.background)

        
    }
}

struct BottomTabView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabView()
            .environmentObject(SessionManager())
    }
}
