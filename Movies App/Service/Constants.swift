//
//  Constants.swift
//  Movies App
//
//  Created by Eren Çelik on 9.06.2021.
//

import Foundation

struct Constants {
    
    static let baseUrl = "https://api.themoviedb.org"
    static let apiKey : String = "Put Your APIKey"
    
    
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
        case urlError
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
            case .urlError:
                return "URL Error"
            }
        }
    }
    
    public enum HTTPMethods: String {
        case get = "GET"
    }
}
