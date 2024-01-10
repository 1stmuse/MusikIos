//
//  SongModel.swift
//  Musil
//
//  Created by iMuse on 30/12/2023.
//

import Foundation

struct SongResponse: Codable {
    let tracks: Track
    
    enum CodingKeys: String, CodingKey {
        case tracks
    }
}

struct Track: Codable, Hashable {
    let data: [SongModel]
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}


struct SongModel: Codable , Identifiable, Hashable {
    let id: Int
   
    let title, titleShort, titleVersion: String?
    let link: String
    let duration: Int
    let position: Int
    let diskNumber: Int?
    let rank: Int?
    let releaseDate: String?
    let explicitLyrics: Bool
    let explicitContentLyrics, explicitContentCover: Int
    let preview: String
    let availableCountries: [String]?
    let md5Image: String
    let artist: Artist
    let album: Album?
   
    let type: String

    enum CodingKeys: String, CodingKey {
        case title, id, duration
        case titleShort = "title_short"
        case titleVersion = "title_version"
        case link
        case position
        case diskNumber = "disk_number"
        case rank
        case releaseDate = "release_date"
        case explicitLyrics = "explicit_lyrics"
        case explicitContentLyrics = "explicit_content_lyrics"
        case explicitContentCover = "explicit_content_cover"
        case preview
        case availableCountries = "available_countries"
      
        case md5Image = "md5_image"
        case artist, type, album
    }
}



let demoSong: [SongModel] = [
    .init(id: 2, title: "Unavailable", titleShort: "Unav", titleVersion: "v3", link: "df", duration: 8, position: 2, diskNumber: 2, rank: 1, releaseDate: "sfdfjdfj", explicitLyrics: false, explicitContentLyrics: 3, explicitContentCover: 4, preview: "edfg", availableCountries: [":d"], md5Image: "https://api.deezer.com/genre/0/image", artist: .init(id: 2, name: "Davido", link: "hrrtsc", share: "sfdg", picture: "sfdd", pictureSmall: "sdsf", pictureMedium: "sfd", pictureBig: "sfdf", pictureXl: "sdfd", radio: true, tracklist: "adsfd", type: "sdfd", nb_fan: 2), album: nil,  type: "kdnsf")
]


