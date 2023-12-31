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
                Image(item.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 90)
                
                VStack(spacing: 20){
                    Text(item.title)
                    Text(item.artist)
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
        SongRow(item: .init(artist: "Davido", title: "Unavailable", image: "davido"))
            .preferredColorScheme(.dark)
    }
}
