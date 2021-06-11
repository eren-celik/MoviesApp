//
//  ViewBuilder.swift
//  Movies App
//
//  Created by Eren  Çelik on 11.06.2021.
//

import UIKit


final class ViewBuilder {
    
    static func makeDetailView(with viewModel: ShowDetailViewModelProtocol) -> DetailShowViewController {
        let storyBoard = UIStoryboard(name: "DetailShowView", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "DetailShowView") as! DetailShowViewController
        viewController.viewModel = viewModel
        return viewController
    }
    
}
