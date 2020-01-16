//
//  MoviesListViewController+SkeletonView.swift
//  Movies
//
//  Created by Eduardo Leite on 06/09/19.
//  Copyright © 2019 Cubos. All rights reserved.
//

import UIKit
import SkeletonView

extension MovieListViewController: SkeletonCollectionViewDataSource {
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func numSections(in collectionSkeletonView: UICollectionView) -> Int {
        return 1
    }
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "movieCell"
    } 
}
