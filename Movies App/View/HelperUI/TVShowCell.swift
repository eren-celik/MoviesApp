//
//  ShowCell.swift
//  Movies App
//
//  Created by Eren  Çelik on 10.06.2021.
//

import UIKit
import SDWebImage

class TVShowCell: UITableViewCell {
    static let identifier : String = "movieCell"
    
    @IBOutlet weak private var tvShowImage: UIImageView!
    @IBOutlet weak private var tvShowName: UILabel!
    @IBOutlet weak private var tvAvaregeRating: UILabel!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}

extension TVShowCell {
    func configureCell(cellText: String,
                       cellImageURL: String,
                       cellAvarageRating: String) {
        
        tvShowImage.sd_setImage(with: URL(string: cellImageURL)!)
        tvShowName.text = cellText
        tvAvaregeRating.text = cellAvarageRating
    }
    
    private func configureUI(){
        tvShowImage.layer.cornerRadius = 20
    }
    
}

/*

 /*
  ## Add Supported Image Sizes
                                   Min Res      Max Res
  poster   = Poster ............  500 x 750   2000 x 3000
  backdrop = Fanart ............ 1280 x 720   3840 x 2160
  still    = TV Show Episode ... 1280 x 720   3840 x 2160
  profile  = Actors Actresses ..  300 x 450   2000 x 3000
  logo     = TMDb Logo

  ## API Supported Image Sizes

  |  poster  | backdrop |  still   | profile  |   logo   |
  | :------: | :------: | :------: | :------: | :------: |
  | -------- | -------- | -------- |    w45   |    w45   |
  |    w92   | -------- |    w92   | -------- |    w92   |
  |   w154   | -------- | -------- | -------- |   w154   |
  |   w185   | -------- |   w185   |   w185   |   w185   |
  | -------- |   w300   |   w300   | -------- |   w300   |
  |   w342   | -------- | -------- | -------- | -------- |
  |   w500   | -------- | -------- | -------- |   w500   |
  | -------- | -------- | -------- |   h632   | -------- |
  |   w780   |   w780   | -------- | -------- | -------- |
  | -------- |  w1280   | -------- | -------- | -------- |
  | original | original | original | original | original |

  Original Size is the size of the uploaded image.
  It can be between Minimum Resolution and Maximum Resolution.

  */

 */