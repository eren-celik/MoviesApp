//
//  TVShowModel.swift
//  Movies App
//
//  Created by Eren Çelik on 9.06.2021.
//

import Foundation

// MARK: - TVShowModel
struct TVShowModel: Decodable {
    let backdropPath: String?
    let genres: [Genre]
    let name: String
    let numberOfEpisodes, numberOfSeasons: Int
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case genres
        case name
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}

