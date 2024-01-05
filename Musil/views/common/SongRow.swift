//
//  SongRow.swift
//  Musil
//
//  Created by iMuse on 30/12/2023.
//

import SwiftUI

struct SongRow: View {
    
    let item: SongModel
    
    var body: some View {
        HStack(){
            HStack(spacing:15){
                ImageView(url: item.artist.picture!)
                    .cornerRadius(15)
                    .frame(width: 80, height: 90)
                
                VStack(alignment: .leading, spacing: 20){
                    Text(item.title)
                        .lineLimit(1)
                    Text(item.artist.name)
                }
            }//END OF HSTACK
            Spacer()
            Image(systemName: "ellipsis")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 90)
                .rotationEffect(.degrees(90))
               
        }//END OF HSTACK
        .padding()
        .frame(maxWidth: .infinity)
    }
}

struct SongRow_Previews: PreviewProvider {
    static var previews: some View {
        SongRow(item: demoSong[0])
            .preferredColorScheme(.dark)
    }
}
