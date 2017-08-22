//
//  HomeViewController.swift
//  DafitiTest
//
//  Created by Tomate Albertini on 18/08/17.
//  Copyright © 2017 dafiti. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource,UISearchBarDelegate {

    let reuseIdentifier = "MovieCollectionViewCell"
    
    let itensPerRow:CGFloat = 2
    let sectionInsets = UIEdgeInsets(top: 0.0, left: 5.0, bottom: 10.0, right: 5.0)
    let minimumInteritemSpacing:CGFloat = 5
    var moviesDataSource:[MoviePlus] = [MoviePlus]()
    var refreshControl:UIRefreshControl!
    
    @IBOutlet weak var searchBar:UISearchBar?
    @IBOutlet weak var collectionView:UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        self.loadData()
        
        if self.searchBar != nil {
            self.searchBar?.becomeFirstResponder()
        }
        
        let layout = HomeProgramsLayout()
        layout.minimumLineSpacing = 0
        
        self.collectionView.setCollectionViewLayout(layout, animated: false)
        self.collectionView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl.tintColor = UIColor.white
        self.refreshControl.addTarget(self, action: #selector(refresh), for: UIControlEvents.valueChanged)
        self.collectionView!.addSubview(refreshControl)
    }
    
    func loadData() {
        
        self.showActivityIndicator(view: self.view, withOpaqueOverlay: true)
        
        Control.getTrendindMovies { (result, erro) in
            
            if erro == nil {
                
                MoviesShared.shared.addMovies(mov: result!)
                
                if self.searchBar != nil {
                    self.moviesDataSource = MoviesShared.shared.filteredMovies
                } else {
                    self.moviesDataSource = MoviesShared.shared.movies
                }
                self.collectionView.reloadData()
            }
            self.hideActivityIndicator(view: self.view)
            self.stopRefresher()
        }
    }
    
    func stopRefresher() {
        self.refreshControl.endRefreshing()
    }
    
    func refresh(sender:AnyObject) {
        
        self.loadData()
    }
    
    //MARK: CollectionView
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MovieCollectionViewCell
        cell.movie = self.moviesDataSource[indexPath.row]
        cell.loadData()
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.moviesDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        Control.getMovieDetails(id: (self.moviesDataSource[indexPath.row].movie?.ids?.trakt)!) { (movieDetails, erroString) in
            
            let st = UIStoryboard.init(name: "Main", bundle: nil)
            let controller = st.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
            controller.movieDetails = movieDetails
            controller.imageMovie = (collectionView.cellForItem(at: indexPath) as! MovieCollectionViewCell).imageMovie
            
            let navController = UINavigationController.init(rootViewController: controller)
            navController.setNavigationBarHidden(true, animated: false)
            
            self.present(navController, animated: true, completion:nil)
            
        }
    }
    
    
    //MARK: SearchBar
    func moviesFiltered(searchText:String) {
        
        self.moviesDataSource = MoviesShared.shared.moviesByName(name: searchText)
        self.collectionView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar,
                   textDidChange searchText: String){
        
        print(searchText)
        self.moviesFiltered(searchText: searchText)
    }
}

