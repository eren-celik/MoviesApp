//
//  ViewController.swift
//  Movies App
//
//  Created by Eren  Çelik on 9.06.2021.
//

import UIKit
import JGProgressHUD

enum IndicatorStyles {
    case error
    case loading
    
    var indicatorView: JGProgressHUDIndicatorView {
        switch self {
        case .error:
            return JGProgressHUDErrorIndicatorView()
        case .loading:
            return JGProgressHUDIndicatorView()
        }
    }
}

class MainViewController: UIViewController {
    
    private var tableView: UITableView = {
        var tableView = UITableView()
        tableView = UITableView(frame: UIScreen.main.bounds)
        let nib = UINib(nibName: "TVShowCell", bundle: nil)
        tableView.register(nib,
                           forCellReuseIdentifier: TVShowCell.identifier)
        return tableView
    }()
    
    var viewModel: MovieListViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    private var movieList: [Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI()
    }
    
}

extension MainViewController {
    
    private func configureUI() {
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationBar.topItem?.title = "TV Shows"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshList))
        
        view.addSubview(tableView)
    }
    
    private func loadingIndicator() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        let indicator = UIActivityIndicatorView()
        indicator.center = footerView.center
        footerView.addSubview(indicator)
        indicator.startAnimating()
        return footerView
    }

    private func showHud(text: String, viewType: IndicatorStyles ) -> JGProgressHUD {
        let hud = JGProgressHUD()
        hud.textLabel.text = text
        hud.shadow = JGProgressHUDShadow(color: .black, offset: .zero, radius: 5.0, opacity: 0.2)
        hud.indicatorView = viewType.indicatorView
        hud.show(in: self.view)
        hud.dismiss(afterDelay: 3.0)
        return hud
    }
    
    @objc private func refreshList(){
        self.movieList.removeAll()
        _ = showHud(text: "Loading", viewType: .loading)
        viewModel.getData()
    }
}

extension MainViewController: MovieListViewModelDelegate{
    func handleViewModelOutput(_ output: MovieListViewModelOutput) {
        switch output {
        case .showMovieList(let movieList):
            self.movieList = movieList.results
            self.tableView.reloadData()
        case .showMoreMovie(let movieList):
            self.movieList += movieList.results
            self.tableView.tableFooterView = nil
            self.tableView.reloadData()
        case .showAlert(let text):
            _ = showHud(text: text, viewType: .error)
        }
    }
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TVShowCell.identifier, for: indexPath) as? TVShowCell else {
            return UITableViewCell()
        }
        
        cell.configureCell(cellText: movieList[indexPath.row].name,
                           cellImageURL: movieList[indexPath.row].backdropPath ?? "https://www.natro.com/hosting-sozlugu/wp-content/uploads/2015/12/404-not-found.png",
                           cellAvarageRating: "\(movieList[indexPath.row].voteAverage)",
                           cellVotecount: "\(movieList[indexPath.row].voteCount)"
        )
        
        if indexPath.row == movieList.count-2 {
            self.tableView.tableFooterView = loadingIndicator()
            DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 1) { [weak self] in
                self?.viewModel.getMoreData()
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Todo:
    }
}


