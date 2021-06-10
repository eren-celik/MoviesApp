//
//  ViewController.swift
//  Movies App
//
//  Created by Eren  Çelik on 9.06.2021.
//

import UIKit

class MainViewController: UIViewController  {
    
    private var tableView: UITableView = {
        var tableView = UITableView()
        tableView = UITableView(frame: UIScreen.main.bounds)
        let nib = UINib(nibName: "TVShowCell", bundle: nil)
        tableView.register(nib,
                           forCellReuseIdentifier: TVShowCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationBar.topItem?.title = "TV Shows"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(tableView)
    }
}

extension MainViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TVShowCell.identifier, for: indexPath) as? TVShowCell else {
            return UITableViewCell()
        }
        
        cell.configureCell(cellText: "eren",
                           cellImageURL: "https://image.tmdb.org/t/p/original/h48Dpb7ljv8WQvVdyFWVLz64h4G.jpg",
                           cellAvarageRating: "1.3")
        return cell
    }
    

}

extension MainViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Todo:
    }
}

