//
//  MoviesListViewController+UICollectionViewDataSource.swift
//  Movies
//
//  Created by Eduardo Leite on 05/09/19.
//  Copyright © 2019 Cubos. All rights reserved.
//

import UIKit

extension MovieListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isSearchActive {
            if filteredMovies.count == 0 {
                setBackgroundErrorView(withText: "Nenhum filme com esse texto encontrado",
                                       image: UIImage(named: "loupe"),
                                       andCollectionView: self.moviesCollectionView)
            } else {
                moviesCollectionView.backgroundView?.isHidden = true
            }
            return filteredMovies.count
        } else {
            if internetProblem {
                setBackgroundErrorView(withText: "Error de conexão, verifique se você tem acesso a internet",
                                       image: UIImage(named: "close"),
                                       andCollectionView: self.moviesCollectionView)
            } else {
                moviesCollectionView.backgroundView?.isHidden = true
            }
            return movies.count
        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell {
        guard let cell = moviesCollectionView
            .dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as? MoviesCollectionViewCell
            else { return UICollectionViewCell() }
        
            if isSearchActive {
                cell.prepare(movie: filteredMovies[indexPath.row])
            } else {
                cell.prepare(movie: movies[indexPath.row])
            }
        return cell
    }
}
