//
//  MovieContracts.swift
//  Movies App
//
//  Created by Eren  Çelik on 10.06.2021.
//

import Foundation


protocol MovieListViewModelProtocol {
    var delegate: MovieListViewModelDelegate? { get set }
    func load()
    func selectMovie(at index: Int)
}

enum MovieListViewModelOutput {
    case updateTitle(String)
    case setLoading(Bool)
    case showMovieList(TVShowsModel)
}

//enum MovieListViewRoute {
//    case detail(MovieDetailViewModelProtocol)
//}

protocol MovieListViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: MovieListViewModelOutput)
//    func navigate(to route: MovieListViewRoute)
}

