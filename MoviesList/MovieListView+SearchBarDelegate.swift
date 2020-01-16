//
//  MovieListView+SearchBarDelegate.swift
//  Movies
//
//  Created by Eduardo Leite on 06/09/19.
//  Copyright © 2019 Cubos. All rights reserved.
//

import UIKit

extension MovieListViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filteredMovies = movies.filter({ (text) -> Bool in
            let tmp: NSString = (text.title as NSString?)!
            let range = tmp.range(of: searchController.searchBar.text!, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        if searchController.searchBar.text! == "" {
            isSearchActive = false
        } else {
            self.isSearchActive = true
        }
        self.moviesCollectionView.reloadData()
    }
    
}
