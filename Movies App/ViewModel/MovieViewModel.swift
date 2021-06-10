//
//  MovieViewModel.swift
//  Movies App
//
//  Created by Eren Çelik on 9.06.2021.
//

//Brings a shows URL:https://api.themoviedb.org/3/tv/popular?api_key=4005c573921688f26f2b7c5c89d03c88&language=en-US&page=1
//Brings a spesific show URL: https://api.themoviedb.org/3/tv/31917?api_key=4005c573921688f26f2b7c5c89d03c88&language=en-US#

import Foundation
import Combine


class MovieViewModel : ObservableObject {
    private let apiKey : String = "4005c573921688f26f2b7c5c89d03c88"
    
    
}



class NetworkManager {
    
    static func downloadData(url: URL) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw Constants.NetworkError.invalidResponse
                }
                return output.data
            }
            .eraseToAnyPublisher()
    }
}
