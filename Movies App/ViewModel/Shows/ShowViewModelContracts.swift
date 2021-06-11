//
//  MovieContracts.swift
//  Movies App
//
//  Created by Eren  Çelik on 10.06.2021.
//

import Foundation


protocol ShowListViewModelProtocol {
    var delegate: ShowListViewModelDelegate? { get set }
    func getData()
    func getMoreData()
    func selectMovie(at showID: Int)
}

protocol ShowListViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: ShowListViewModelOutput)
    func navigate(to route: ShowListViewRoute)
}

enum ShowListViewModelOutput {
    case showMovieList(TVShowsModel)
    case showMoreMovie(TVShowsModel)
    case showAlert(String)
}

enum ShowListViewRoute {
    case detail(ShowDetailViewModelProtocol)
}


