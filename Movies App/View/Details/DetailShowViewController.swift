//
//  DetailShowViewController.swift
//  Movies App
//
//  Created by Eren Çelik on 11.06.2021.
//

import UIKit

class DetailShowViewController: UIViewController {
    
    @IBOutlet weak private var showName: UILabel!
    
    var viewModel: ShowDetailViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
    }
}


extension DetailShowViewController: ShowDetailViewModelDelegate{
    func showDetail(_ presentation: TVShowModel) {
        print(presentation.name)
    }
}
