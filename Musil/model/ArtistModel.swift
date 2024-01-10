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
    let nb_fan: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, link, share, picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case nb_fan = "nb_fan"
        case radio, tracklist, type
    }
}

let demoArtis: Artist = .init(id: 12, name: "Davido", link: "jshdjsf", share: "skjfsf", picture: "https://e-cdns-ima", pictureSmall: "https://e-cdns-images.dzcdn.net/images/artist/f2bc007e9133c946ac3c3907ddc5d2ea/250x250-000000-80-0-0.jpg", pictureMedium: "https://e-cdns-images.dzcdn.net/images/artist/f2bc007e9133c946ac3c3907ddc5d2ea/250x250-000000-80-0-0.jpg", pictureBig: "skfjdkc", pictureXl: "wslsfml", radio: false, tracklist: "sfdf", type: "sfdf", nb_fan: 20)
