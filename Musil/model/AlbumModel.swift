//
//  AlbumModel.swift
//  Musil
//
//  Created by iMuse on 02/01/2024.
//

import Foundation


struct Album: Codable, Identifiable, Hashable {
    let id: Int
    let title: String?
    let link, cover: String?
    let coverSmall, coverMedium, coverBig, coverXl, nbTracks: String?
    let md5Image, releaseDate: String?
    let tracklist: String?
    let type: String

    enum CodingKeys: String, CodingKey {
        case id, title, link, cover
        case coverSmall = "cover_small"
        case coverMedium = "cover_medium"
        case coverBig = "cover_big"
        case coverXl = "cover_xl"
        case md5Image = "md5_image"
        case releaseDate = "release_date"
        case nbTracks = "nb_tracks"
        case tracklist, type
    }
}
