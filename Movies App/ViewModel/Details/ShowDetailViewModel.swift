//
//  MovieDetailViewModel.swift
//  Movies App
//
//  Created by Eren Çelik on 10.06.2021.
//

import Foundation
import Combine

final class ShowDetailViewModel: ShowDetailViewModelProtocol {
    
    
    weak var delegate : ShowDetailViewModelDelegate?
    private let movieID: Int
    private let networkManager : NetworkManager
    private var cancallable = Set<AnyCancellable>()
    
    init(movieID : Int, networkManager: NetworkManager) {
        self.movieID = movieID
        self.networkManager = networkManager
    }
    
    
    
    func getData() {
        
        guard let detailShowURL = URL(string:
                                        "\(Constants.baseUrl)/3/tv/\(movieID)?api_key=\(Constants.apiKey)&language=en-US") else {
            return
        }
        
        networkManager.getDataFromIntenet(url: detailShowURL, decodingType: TVShowModel.self)
            .sink { status in
                switch status{
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] value in
                self?.delegate?.showDetail(value)
            }
            .store(in: &cancallable)
        
    }
}
