//
//  NetworkLayer.swift
//  Movies App
//
//  Created by Eren  Çelik on 10.06.2021.
//

import Foundation
import Combine


protocol NetworkProtocol: AnyObject {
    func getDataFromIntenet<T>(url: URL,
                               decodingType: T.Type) -> AnyPublisher<T, Error> where T: Decodable
}

final class NetworkManager: NetworkProtocol {
    
    func getDataFromIntenet<T>(url: URL,
                               decodingType: T.Type) -> AnyPublisher<T, Error> where T : Decodable {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw Constants.NetworkError.invalidResponse
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}
