//
//  PlayerView.swift
//  Musil
//
//  Created by iMuse on 30/12/2023.
//

import SwiftUI

struct PlayerView: View {
    @StateObject var vm: AudioPlayer
    let item: SongModel
    @Binding var showBottomTab: Bool
    @State private var h: CGFloat = 40
    @State private var showLyrics = false
    
    var body: some View {
        ZStack{
            
            ScrollView {
                
                VStack(alignment:.leading){
                    ImageView(url: item.artist.picture!)
                        .cornerRadius(30)
                        .frame(height: 400)
                        
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text(item.title ?? "Title")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text(item.artist.name)
                            .foregroundColor(.white)
                        
                        
                    }//END OF VSTACK
                    .padding(.vertical, 30)
                    HStack {
                        Text("\(Int(vm.currentTime))")
                            .foregroundColor(.white)
                        ZStack(alignment:.leading) {
                            RoundedRectangle(cornerRadius: 1, style: .continuous)
                                .frame(height: 2)
                                .foregroundStyle(Color.lightBackground)
                            RoundedRectangle(cornerRadius: 1, style: .continuous)
                                .frame(width: 60,height: 2)
                                .foregroundStyle(Color.white)
                        }

                        Text("-\(Int(vm.duration) - Int(vm.currentTime))")
                            .foregroundColor(.white)
                    }
                   
                    control
                    
                    Spacer()
                }
                
                .padding(.horizontal, 20)
                .padding(.top, 70)
                .background(Color.background)
                .onTapGesture {
                    withAnimation {
                        showLyrics = false
                    }
                }
                
            }
            .overlay(alignment: .bottom) {
                VStack{
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: showLyrics ? 600 : 50)
                .background(Color.primaryColor)
                .cornerRadius(10)
                .padding(.horizontal, 10)
                .onTapGesture {
                    withAnimation {
                        showLyrics.toggle()
                    }
                }
                    
            }// END OF OVERLAY
            .background(Color.background)
            
           
            
        }// END OF ZSTACK
        .onAppear{
            showBottomTab = false
//            vm.stop()
            vm.load(song: item)
            vm.play(song: item)
        }
        .onDisappear{
            showBottomTab = true
        }
        .ignoresSafeArea()
        
    }
    
    var control: some View  {
        HStack(spacing: 20) {
            Image(systemName: "arrow.left.arrow.right")
                .foregroundColor(.white)
            Spacer()
            ControlButton(type: .prev, width: 30, height: 30, iconSize: 10) {
                
            }
            Spacer()
            ControlButton(type: vm.isPlaying ? .pause : .play, width: 50, height: 50, iconSize: 20) {

                if vm.isPlaying {
                    vm.pause()
                } else {
                    vm.play(song: item)
                }
                
            }
            Spacer()
            ControlButton(type: .next, width: 30, height: 30, iconSize: 10) {
                
            }
            Spacer()
            Image(systemName: "shuffle")
                .foregroundColor(.white)
        }
        .padding(.top, 30)
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PlayerView(vm: AudioPlayer(), item: demoSong[0], showBottomTab: .constant(true))
        }
        
    }
}
