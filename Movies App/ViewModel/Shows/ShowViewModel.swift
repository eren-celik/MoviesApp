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


final class ShowViewModel : ObservableObject, ShowListViewModelProtocol{
    
    weak var delegate: ShowListViewModelDelegate?
    
    private let networkManager : NetworkManager
    private var cancellable = Set<AnyCancellable>()
    private var pageCount : Int = 1
    
    init(networkManager: NetworkManager){
        self.networkManager = networkManager
    }
    
    func getData() {
        guard let url = URL(string: "\(Constants.baseUrl)/3/tv/popular?api_key=\(Constants.apiKey)&language=en-US&page=1") else {
            return
        }
        networkManager.getDataFromIntenet(url: url, decodingType: TVShowsModel.self)
            .sink { status in
                switch status{
                case .finished:
                    break
                case .failure(let error):
                    self.notify(.showAlert(error.localizedDescription))
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] values in
                self?.notify(.showMovieList(values))
            }
            .store(in: &cancellable)
    }
    
    func getMoreData() {
        pageCount = pageCount + 1
        
        guard let url = URL(string: "\(Constants.baseUrl)/3/tv/popular?api_key=\(Constants.apiKey)&language=en-US&page=\(pageCount)") else {
            return
        }
        
        networkManager.getDataFromIntenet(url: url, decodingType: TVShowsModel.self)
            .sink { status in
                switch status{
                case .finished:
                    break
                case .failure(let error):
                    self.notify(.showAlert(error.localizedDescription))
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] values in
                if self?.pageCount == values.totalPages {
                    self?.notify(.showAlert("No More Data"))
                }else{
                    self?.notify(.showMoreMovie(values))
                }

            }
            .store(in: &cancellable)
    }
}
extension ShowViewModel {
    
    private func notify(_ output: ShowListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
    
    func selectMovie(at showID: Int) {
        let viewModel = ShowDetailViewModel(movieID: showID, networkManager: networkManager)
        delegate?.navigate(to: .detail(viewModel))
    }
    
}




