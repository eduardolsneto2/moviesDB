//
//  MovieDescriptionViewController.swift
//  Movies
//
//  Created by Eduardo Leite on 06/09/19.
//  Copyright © 2019 Cubos. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDescriptionViewController: UIViewController {

    var movie: Movie?
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settup()
    }
    
    func settup() {
        if let title = movie?.title {
            self.navigationItem.title = title
        }
        self.navigationController!.navigationBar.topItem?.title = ""
        if let description = movie?.overview {
            self.movieDescription.text = description
        }
        if let path = movie?.poster_path {
            let url = URL(string: movieImageURL + path)!
            self.movieImageView.af_setImage(withURL: url)
        }
    }

}
