//
//  BottomTabs.swift
//  Musil
//
//  Created by iMuse on 31/12/2023.
//

import SwiftUI

struct BottomTabView: View {
    

    @State private var selectedTab: Tabs = .Home
    @State var showBottomTab: Bool = true
    @ObservedObject private var vm = SongViewModel()
    
    var body: some View {
        VStack(){
            ZStack {
                
                switch selectedTab {
                case .Home:
                        HomeView(showBottomTab: $showBottomTab)
                        .environmentObject(vm)
                    
                case .Explore:
                    Color.green
                        .opacity(selectedTab == .Explore ? 1.0 : 0.0)
                        .ignoresSafeArea()
                case .Others:
                    Text("Othwrs")
                case .Library:
                    Text("Library")
                }
               
            }
            Spacer()
            
         
            if showBottomTab {
                CustomView(selectedTab: $selectedTab)
                    
            } 
                
            
           
           
            
        }
       
//        .ignoresSafeArea()
        .background(Color.background)

        
    }
}

struct BottomTabView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabView()
            
    }
}
