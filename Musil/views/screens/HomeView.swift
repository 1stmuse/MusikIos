//
//  HomeView.swift
//  Musil
//
//  Created by iMuse on 03/01/2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var vm = SongViewModel()
  
    var body: some View {
        NavigationView {
            ScrollView{
                VStack {
                    header
                        .padding(.bottom, 20)
                    
                    if (vm.songs.first != nil) {
                        
                        ImageView(url: vm.songs.first!.album?.cover! ?? "https://api.deezer.com/genre/0/image")
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .frame(height: 200)
                            .overlay(
                                VStack {
                                    Text("Continue Listening.....")
                                    Text("Home Alone")
                                    ControlButton(type: .play, width: 40, height: 40, iconSize: 15) {
                                        
                                    }
                                    Text(vm.songs.first!.title)
                                        .font(.system(.headline, design: .rounded, weight: .bold))
                                    Text("Duration \(vm.songs.first!.duration)")
                                }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .background(Color.black.opacity(0.5))
                                
                            )
                        
                            
                        
                    }
                }
                
               
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.primary)
            .foregroundColor(.white)
           
        }
        .task {
           await vm.loadSong()
        }
            
    }
        
        
}
    
    private var header: some View {
        
        HStack{
            Text("Home")
                .font(.largeTitle)
               
            Spacer()
            HStack(spacing: 30) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                Image("davido")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
            }
            
        }
        .padding(.horizontal, 20)
    }
    


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
