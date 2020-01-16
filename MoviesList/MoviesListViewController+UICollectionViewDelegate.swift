//
//  MoviesListViewController+UICollectionViewDelegate.swift
//  Movies
//
//  Created by Eduardo Leite on 05/09/19.
//  Copyright © 2019 Cubos. All rights reserved.
//

import UIKit

extension MovieListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "descID") as? MovieDescriptionViewController {
            viewController.movie = self.movies[indexPath.row]
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if !isSearchActive {
            if indexPath.row == self.movies.count - 3 {
                if (page > 1) && (!loadingMovies) {
                    requestMovies()
                }
            }
            
        }
    }
}
