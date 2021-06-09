//
//  TVShowCell.swift
//  Movies App
//
//  Created by Eren Çelik on 10.06.2021.
//

import UIKit
import SDWebImage

class TVShowCell: UITableViewCell {
    static let identifier : String = "movieCell"
    
    private let tvShowTitle: UILabel = {
        var label = UILabel()
        label.font = .rounded(ofSize: 15, weight: .medium)
        return label
    }()
    private let tvShowImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 25
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(tvShowTitle)
        addSubview(tvShowImage)
        tvShowImage.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w342/h48Dpb7ljv8WQvVdyFWVLz64h4G.jpg")!,
                                completed: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        tvShowImage.anchor(top: self.topAnchor,
                           left: self.leftAnchor,
                           bottom: self.bottomAnchor,
                           paddingLeft: 10,
                           width: 120,
                           height: 120
        )
        tvShowTitle.anchor(left: tvShowImage.leftAnchor,
                                paddingLeft: 10)

    }
    
}

extension TVShowCell {
    
    public func configureCell(tvShowName: String){
        tvShowTitle.text = tvShowName
    }
    
}
//https://image.tmdb.org/t/p/original/h48Dpb7ljv8WQvVdyFWVLz64h4G.jpg


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
