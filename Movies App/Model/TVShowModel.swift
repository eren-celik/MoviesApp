//
//  TVShowModel.swift
//  Movies App
//
//  Created by Eren Çelik on 9.06.2021.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let tVShowModel = try? newJSONDecoder().decode(TVShowModel.self, from: jsonData)

import Foundation

// MARK: - TVShowModel
struct TVShowModel: Codable {
    let backdropPath: String
    let createdBy: [CreatedBy]
    let episodeRunTime: [Int]
    let firstAirDate: String
    let genres: [Genre]
    let homepage: String
    let id: Int
    let inProduction: Bool
    let languages: [String]
    let lastAirDate: String
    let lastEpisodeToAir: LastEpisodeToAir
    let name: String
    let nextEpisodeToAir: String?
    let networks: [Network]
    let numberOfEpisodes, numberOfSeasons: Int
    let originCountry: [String]
    let originalLanguage, originalName, overview: String
    let popularity: Double
    let posterPath: String
    let productionCompanies: [Network]
    let productionCountries: [ProductionCountry]
    let seasons: [Season]
    let spokenLanguages: [SpokenLanguage]
    let status, tagline, type: String
    let voteAverage, voteCount: Int

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case createdBy = "created_by"
        case episodeRunTime = "episode_run_time"
        case firstAirDate = "first_air_date"
        case genres, homepage, id
        case inProduction = "in_production"
        case languages
        case lastAirDate = "last_air_date"
        case lastEpisodeToAir = "last_episode_to_air"
        case name
        case nextEpisodeToAir = "next_episode_to_air"
        case networks
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview, popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case seasons
        case spokenLanguages = "spoken_languages"
        case status, tagline, type
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - CreatedBy
struct CreatedBy: Codable {
    let id: Int
    let creditID, name: String
    let gender: Int
    let profilePath: String

    enum CodingKeys: String, CodingKey {
        case id
        case creditID = "credit_id"
        case name, gender
        case profilePath = "profile_path"
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}

// MARK: - LastEpisodeToAir
struct LastEpisodeToAir: Codable {
    let airDate: String
    let episodeNumber, id: Int
    let name, overview, productionCode: String
    let seasonNumber: Int
    let stillPath: String
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case episodeNumber = "episode_number"
        case id, name, overview
        case productionCode = "production_code"
        case seasonNumber = "season_number"
        case stillPath = "still_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - Network
struct Network: Codable {
    let name: String
    let id: Int
    let logoPath: String?
    let originCountry: String

    enum CodingKeys: String, CodingKey {
        case name, id
        case logoPath = "logo_path"
        case originCountry = "origin_country"
    }
}

// MARK: - ProductionCountry
struct ProductionCountry: Codable {
    let iso3166_1, name: String

    enum CodingKeys: String, CodingKey {
        case iso3166_1 = "iso_3166_1"
        case name
    }
}

// MARK: - Season
struct Season: Codable {
    let airDate: String
    let episodeCount, id: Int
    let name, overview, posterPath: String
    let seasonNumber: Int

    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case episodeCount = "episode_count"
        case id, name, overview
        case posterPath = "poster_path"
        case seasonNumber = "season_number"
    }
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
    let englishName, iso639_1, name: String

    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso639_1 = "iso_639_1"
        case name
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int{
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
