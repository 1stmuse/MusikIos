//
//  ArtistView.swift
//  Musil
//
//  Created by iMuse on 11/01/2024.
//

import SwiftUI


struct ArtistView: View {
    
    let artist: Artist
    let tracks: [TrackModel]
    
    var body: some View {
        ScrollView {
            VStack(alignment:.leading) {
                ImageView(url: artist.pictureMedium)
                    .cornerRadius(30)
                    .frame(height: 400)
                
                HStack {
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Artist name")
                        Text(artist.name)
                    }
                    Spacer()
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Number of Fans")
                            .font(.system(.callout, design: .rounded, weight: .medium))
                        Text("\(artist.nb_fan ?? 0)")
                            .font(.system(.callout, design: .rounded, weight: .medium))
                    }
                } /// END OF HSTACK
                .padding(.top, 20)
                
                VStack(alignment:.leading) {
                    VStack(alignment:.leading) {
                        Text("Track list")
                            .font(.system(.title, design: .rounded, weight: .medium))
                    }
                    
                    
                    HStack {
                        Text("Name")
                        Spacer()
                        Text("Duration")
                    }
                    
                    ForEach(tracks) { track in
                        
                    }
                }
                .padding(.top, 40)
                
                    
                Spacer()
            }// END OF VSTACK
            .foregroundColor(.white)
          
        }// SCROLLVIEW
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 70)
        .padding(.horizontal, 20)
        .background(Color.background)
        .ignoresSafeArea()
       
    }
}

#Preview {
    ArtistView(artist: demoArtis, tracks: trackList)
}
