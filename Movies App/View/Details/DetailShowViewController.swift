//
//  DetailShowViewController.swift
//  Movies App
//
//  Created by Eren Çelik on 11.06.2021.
//

import UIKit
import TagListView

class DetailShowViewController: UIViewController {
    
    @IBOutlet weak var showImageView: UIImageView!
    @IBOutlet weak private var showName: UILabel!
    @IBOutlet weak private var episodeLabel: UILabel!
    @IBOutlet weak private var seasonLabel: UILabel!
    @IBOutlet var tagListView: TagListView!
    
    var viewModel: ShowDetailViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getData()
        configureUI()
    }
}


extension DetailShowViewController: ShowDetailViewModelDelegate{
    
    func showDetail(_ presentation: TVShowModel) {
        showName.text     = presentation.name
        episodeLabel.text = "Total Episodes: \(presentation.numberOfEpisodes)"
        seasonLabel.text  = "Season: \(presentation.numberOfSeasons)"
        tagListView.addTags(presentation.genres.map { $0.name })
        
        guard let backdropPath = presentation.backdropPath,
            let imageURL = URL(string: "https://image.tmdb.org/t/p/original\(backdropPath)") else {
            return
        }
        showImageView.sd_setImage(with: imageURL, completed: nil)
    }
    
    private func configureUI(){
        showName.font = .rounded(ofSize: 30,
                                 weight: .medium)
    }
    
}
