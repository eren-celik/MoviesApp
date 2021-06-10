//
//  MovieContracts.swift
//  Movies App
//
//  Created by Eren  Çelik on 10.06.2021.
//

import Foundation


protocol MovieListViewModelProtocol {
    var delegate: MovieListViewModelDelegate? { get set }
    func getData()
    func getMoreData()
}

protocol MovieListViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: MovieListViewModelOutput)
}

enum MovieListViewModelOutput {
    case showMovieList(TVShowsModel)
    case showMoreMovie(TVShowsModel)
    case showAlert(String)
}

