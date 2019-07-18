//
//  MoviePosterCell.swift
//  Movie-Lister
//
//  Created by   CATHERINE on 16/09/18.
//  Copyright © 2018 Catherine. All rights reserved.
//

import UIKit

class MoviePosterCell: UICollectionViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    
    var name: String? {
        didSet {
            if let movieName = name {
                movieNameLabel.text = movieName
            }
        }
    }
    
    var image: String? {
        didSet {
            if let imageName = image {
                posterImageView.image = UIImage(named: imageName)
            }else {
                posterImageView.image = UIImage(named: "posterthatismissing")
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
