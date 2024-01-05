//
//  HomeView.swift
//  Musil
//
//  Created by iMuse on 03/01/2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var vm: SongViewModel
    @Binding var showBottomTab: Bool
   
    
    var body: some View {
        
        NavigationStack {
            ScrollView(showsIndicators: false){
                
                if vm.isLoading {
                                        
                        ProgressView()
                            .tint(.white)
                            .padding(.top, 300)
                   
                } else {
                    VStack(alignment:.leading) {
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
                                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .background(Color.black.opacity(0.5))
                                    
                                )
                            
                        }
                        
                        // MARK: Top Category
                        Category()
                        
                        // MARK: Artist
                        let slicesSong = vm.songs.prefix(8)
                        
                        Artists(songs: slicesSong)
                        
                        TrendingSongs(songs: vm.songs)
                        
                    }
                }
               
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 20)
            .background(Color.background)
            .foregroundColor(.white)
            .navigationDestination(for: SongModel.self, destination: { song in
                PlayerView(item: song, showBottomTab: $showBottomTab)
            })
            
         
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

struct Category:  View {
    
    var body: some View {
        Text("Top Categories")
            .font(.headline)
            .padding(.top, 20)
        ScrollView(.horizontal, showsIndicators: false) {
            VStack(alignment:.leading) {
                HStack() {
                    ForEach(genres[..<4]) { genre in
                        VStack{
                            Text(genre.title)
                        }
                        .frame(width: 200, height: 80)
                        .background(Color.lightBackground)
                        .overlay(
                            VStack{
                                
                            }.frame(width: 5, height: 80)
                                .background(genre.color)
                            , alignment: .leading)
                    }
                }
                HStack {
                    
                    ForEach(genres[4...]) { genre in
                        VStack{
                            Text(genre.title)
                        }
                        .frame(width: 200, height: 80)
                        .background(Color.lightBackground)
                        .overlay(
                            VStack{
                                
                            }.frame(width: 5, height: 80)
                                .background(genre.color)
                            , alignment: .leading)
                    }
                    
                }
            }
            
            
        }
        
    }
    
}

struct Artists: View {
    let songs: ArraySlice<SongModel>
    var body: some View {
        VStack(alignment: .leading) {
            Text("Top Artist")
                .font(.headline)
                .padding(.vertical, 20)
            ScrollView(.horizontal) {
                HStack(spacing: 25) {
                    ForEach(songs) { song in
                        VStack {
                            ImageView(url: song.artist.pictureMedium)
                                .frame(width: 120, height: 120)
                                .clipShape(Circle())
                            Text(song.artist.name)
                        }
                    }
                }
            }
        }
        .padding(.vertical, 20)
    }
}

struct TrendingSongs: View {
    let songs: [SongModel]
    
    var body: some View {
        
       
        
        VStack(alignment: .leading) {
            Text("Trending Songs")
                .font(.headline)
                .padding(.top, 20)
            
            ForEach(songs) { song in
                NavigationLink(value: song) {
                    SongRow(item: song)
                }
            }
            
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showBottomTab: .constant(true))
            .environmentObject(SongViewModel())
          
    }
}
