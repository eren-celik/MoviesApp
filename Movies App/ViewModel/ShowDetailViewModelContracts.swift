//
//  ShowDetailContracts.swift
//  Movies App
//
//  Created by Eren Çelik on 10.06.2021.
//

import Foundation

protocol ShowDetailViewModelDelegate: AnyObject {
    func showDetail( _ presentation: TVShowModel)
}

protocol ShowDetailViewModelProtocol {
    var delegate: ShowDetailViewModelDelegate? { get set }
    func load()
}
