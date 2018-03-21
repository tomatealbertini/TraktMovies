//
//  HomeViewController.swift
//  DafitiTest
//
//  Created by Tomate Albertini on 18/08/17.
//  Copyright © 2017 dafiti. All rights reserved.
//

import UIKit

enum origemDados {
    case Home
    case Busca
    case Favoritos
}

class HomeViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource,UISearchBarDelegate {

    let reuseIdentifier = "MovieCollectionViewCell"
    
    let itensPerRow:CGFloat = 2
    let sectionInsets = UIEdgeInsets(top: 0.0, left: 5.0, bottom: 10.0, right: 5.0)
    let minimumInteritemSpacing:CGFloat = 5
    
    var refreshControl:UIRefreshControl!
    var origem:origemDados = .Home
    
    @objc var viewModel:MoviesViewModel = MoviesViewModel()
    
    @IBOutlet weak var searchBar:UISearchBar?
    @IBOutlet weak var collectionView:UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        if self.searchBar != nil {
            self.searchBar?.becomeFirstResponder()
            self.origem = .Busca
        }
        
        self.getMovies()
        self.setupCollectionView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        self.removeObserver(self, forKeyPath: #keyPath(viewModel.moviesDataSource), context: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.addObserver(self, forKeyPath: #keyPath(viewModel.moviesDataSource), options: [.new, .old, .initial], context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == #keyPath(viewModel.moviesDataSource) {
            
            self.loadData()
        }
    }
    
    func setupCollectionView() {
        
        let layout = HomeProgramsLayout()
        layout.minimumLineSpacing = 0
        
        self.collectionView.setCollectionViewLayout(layout, animated: false)
        self.collectionView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl.tintColor = UIColor.white
        self.refreshControl.addTarget(self, action: #selector(refresh), for: UIControlEvents.valueChanged)
        self.collectionView!.addSubview(refreshControl)
    }

    func getMovies() {
        
        self.showActivityIndicator(view: self.view, withOpaqueOverlay: true)
        self.viewModel.getTrendingMoview(origem: self.origem,onSuccessComplete: {})
    }
    
    func loadData() {
        
        self.collectionView.reloadData()
        self.hideActivityIndicator(view: self.view)
        self.stopRefresher()
    }
    
    func stopRefresher() {
        self.refreshControl.endRefreshing()
    }
    
    @objc func refresh(sender:AnyObject) {
        self.getMovies()
    }
    
    //MARK: CollectionView
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MovieCollectionViewCell
        cell.movie = self.viewModel.moviesDataSource[indexPath.row]
        cell.loadData()
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.viewModel.moviesDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        Control.getMovieDetails(id: (self.viewModel.moviesDataSource[indexPath.row].movie?.ids?.trakt)!) { (movieDetails, erroString) in
            
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
        
        self.viewModel.moviesByName(name: searchText)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        
        self.moviesFiltered(searchText: searchText)
    }
}

