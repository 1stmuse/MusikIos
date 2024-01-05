//
//  ArtistModel.swift
//  Musil
//
//  Created by iMuse on 31/12/2023.
//

import Foundation


struct Artist: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let link, share, picture: String?
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String
    let radio: Bool
    let tracklist: String
    let type: String

    enum CodingKeys: String, CodingKey {
        case id, name, link, share, picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case radio, tracklist, type
    }
}
