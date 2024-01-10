//
//  TrackModel.swift
//  Musil
//
//  Created by iMuse on 11/01/2024.
//

import Foundation

struct TracksResponse: Codable, Hashable {
    let data: [TrackModel]
}

struct TrackModel: Codable, Identifiable, Hashable {
    let id: Int
    let readable: Bool?
    let title, titleShort, titleVersion, isrc: String?
    let link, share: String?
    let duration, trackPosition, diskNumber, rank: Int?
    let releaseDate: String?
    let explicitLyrics: Bool?
    let explicitContentLyrics, explicitContentCover: Int?
    let preview: String?
   
    let availableCountries: [String]?
    let contributors: [Artist]?
    let md5Image: String?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case id, readable, title
        case titleShort = "title_short"
        case titleVersion = "title_version"
        case isrc, link, share, duration
        case trackPosition = "track_position"
        case diskNumber = "disk_number"
        case rank
        case releaseDate = "release_date"
        case explicitLyrics = "explicit_lyrics"
        case explicitContentLyrics = "explicit_content_lyrics"
        case explicitContentCover = "explicit_content_cover"
        case preview
        case availableCountries = "available_countries"
        case contributors
        case md5Image = "md5_image"
        case type
    }
}

let trackList: [TrackModel] = [
    .init(id: 3, readable: false, title: "ednekn", titleShort: "emdkr", titleVersion: "dknfjfn", isrc: "skenden", link: "kdekf", share: "kdjekfj", duration: 30, trackPosition: 20, diskNumber: 20, rank: 20, releaseDate: "EKDFMRFK", explicitLyrics: true, explicitContentLyrics: 2, explicitContentCover: 30, preview: "dmekf", availableCountries: ["wde"], contributors: nil, md5Image: "lfefk", type: "edlelfk"),
    .init(id: 3, readable: false, title: "ednekn", titleShort: "emdkr", titleVersion: "dknfjfn", isrc: "skenden", link: "kdekf", share: "kdjekfj", duration: 30, trackPosition: 20, diskNumber: 20, rank: 20, releaseDate: "EKDFMRFK", explicitLyrics: true, explicitContentLyrics: 2, explicitContentCover: 30, preview: "dmekf", availableCountries: ["wde"], contributors: nil, md5Image: "lfefk", type: "edlelfk")
]
