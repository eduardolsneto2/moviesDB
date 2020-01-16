//
//  MoviesCollectionViewCell.swift
//  Movies
//
//  Created by Eduardo Leite on 04/09/19.
//  Copyright © 2019 Cubos. All rights reserved.
//

import UIKit
import AlamofireImage

class MoviesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    func prepare(movie: Movie) {
        if let title = movie.title {
            self.movieTitle.text = title
        }
        if let path = movie.poster_path {
            let url = URL(string: movieImageURL + path)!
            self.movieImageView.af_setImage(withURL: url)
        }
    }
}
