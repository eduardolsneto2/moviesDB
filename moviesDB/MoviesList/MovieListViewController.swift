//
//  MovieListViewController.swift
//  Movies
//
//  Created by Eduardo Leite on 04/09/19.
//  Copyright © 2019 Cubos. All rights reserved.
//

import UIKit
import SkeletonView

class MovieListViewController: UIViewController {
    
    var movies = [Movie]()
    var filteredMovies = [Movie]()
    var page = 1
    var isSearchActive = false
    var loadingMovies = false
    var internetProblem = false
    var refreshControl = UIRefreshControl()
    
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settup()
        requestMovies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "Movies"
    }
    
    func requestMovies() {
        self.loadingMovies = true
        if page == 1 {
            self.view.showAnimatedGradientSkeleton()
        }
        MovieRequest.getPopularMovies(withPage: page, onComplete: { (movies) in
            self.movies.append(contentsOf: movies)
            self.view.stopSkeletonAnimation()
            self.view.hideSkeleton()
            self.page += 1
            self.loadingMovies = false
            self.internetProblem = false
            self.refreshControl.endRefreshing()
            self.moviesCollectionView.reloadData()
        }, onError: { (error) in
            self.internetProblem = true
            self.view.stopSkeletonAnimation()
            self.view.hideSkeleton()
            self.loadingMovies = false
            self.refreshControl.endRefreshing()
            self.moviesCollectionView.reloadData()
        }) 
    }
    func settup() {
        if #available(iOS 11.0, *) {
            let searchController = UISearchController(searchResultsController: nil)
            // Setup the Search Controller
            searchController.searchResultsUpdater = self
            searchController.obscuresBackgroundDuringPresentation = false
            searchController.searchBar.placeholder = "Buscar em Filmes"
            searchController.searchBar.tintColor = .white
            navigationItem.searchController = searchController
            definesPresentationContext = true
        }
        self.moviesCollectionView.alwaysBounceVertical = true
        refreshControl.addTarget(self, action: #selector(reload), for: .valueChanged)
        moviesCollectionView.addSubview(refreshControl)
    }
    
    @objc func reload() {
        self.movies = [Movie]()
        self.filteredMovies = [Movie]()
        self.page = 1
        self.internetProblem = false
        moviesCollectionView.backgroundView?.isHidden = true
        requestMovies()
        
    }
    
    func setBackgroundErrorView(withText text: String?, image: UIImage?, andCollectionView collectionView: UICollectionView) {
        let backgroundViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "errorVC")
        guard let myView = backgroundViewController.view as? GenericErrorView else { return }
        if let textContent = text {
            myView.genericErrorText.text = textContent
        }
        if let errorImage = image {
            myView.genericErrorImage.image = errorImage
        }
        collectionView.backgroundView = myView
        collectionView.backgroundView?.isHidden = false
    }

}
