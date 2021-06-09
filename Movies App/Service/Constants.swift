//
//  Constants.swift
//  Movies App
//
//  Created by Eren Çelik on 9.06.2021.
//

import Foundation

struct Constants {
    
    static let baseUrl = "https://api.themoviedb.org/"
    static let apiKey : String = "4005c573921688f26f2b7c5c89d03c88"
    
    
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    enum ContentType: String {
        case json = "application/json"
    }
    
    enum NetworkError : Error {
        case invalidResponse
        case decodingError
        case responseError
        case unknown
        
        var localizedDescription: String{
            switch self{
            case .invalidResponse:
                return "Invalid Response"
            case .decodingError:
                return "Decoding Error an Occured"
            case .responseError:
                return "Response Error an Occured"
            case .unknown:
                return "Unknown Error"
            }
        }
    }
    
    public enum HTTPMethods: String {
        case get = "GET"
    }
}
