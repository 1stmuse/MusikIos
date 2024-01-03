//
//  PlayerView.swift
//  Musil
//
//  Created by iMuse on 30/12/2023.
//

import SwiftUI

struct PlayerView: View {
    let item:SongModel
    @State private var h: CGFloat = 40
    @State private var showLyrics = false
    
    var body: some View {
        ZStack{
            VStack(alignment:.leading){
                ImageView(url: item.md5Image)
                    .cornerRadius(30)
                    .frame(height: 400)
                    
                
                VStack(alignment: .leading, spacing: 10){
                    Text(item.title)
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text(item.artist.name)
                        .foregroundColor(.white)
                }//END OF VSTACK
                .padding(.vertical, 30)
                Divider()
                    .frame(alignment: .leading)
                    .background(Color.lightBackground)
                    .overlay(
                        Divider()
                            .frame(width: 100, height: 2, alignment: .leading)
                            .background(Color.white)
                    )
                control
                Spacer()
            }
            
            .padding(.horizontal, 20)
            .padding(.top, 90)
            .background(Color.background)
            .onTapGesture {
                withAnimation {
                    showLyrics = false
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
            ControlButton(type: .play, width: 50, height: 50, iconSize: 20) {
                
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
        PlayerView(item: demoSong[0])
    }
}
