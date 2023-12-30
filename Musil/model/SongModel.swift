//
//  SongModel.swift
//  Musil
//
//  Created by iMuse on 30/12/2023.
//

import Foundation

struct SongModel {
    
    let id = UUID()
    let artist: String
    let title: String
    let image: String
    let isPlaying: Bool = false
}

let demoSongs: [SongModel] = [
    .init(artist: "Davido", title: "Unavalable", image: "davido")
]
