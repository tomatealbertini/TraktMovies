//
//  FavoritesViewController.swift
//  DafitiTest
//
//  Created by Tomate Albertini on 22/08/17.
//  Copyright © 2017 dafiti. All rights reserved.
//

import UIKit

class FavoritesViewController: HomeViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    override func loadData() {
        
        print("passei por aqui")
        
//        self.showActivityIndicator(view: self.view, withOpaqueOverlay: true)
//        
//        Control.getTrendindMovies { (result, erro) in
//            
//            if erro == nil {
//                
//                MoviesShared.shared.addMovies(mov: result!)
//                
//                if self.searchBar != nil {
//                    self.moviesDataSource = MoviesShared.shared.filteredMovies
//                } else {
//                    self.moviesDataSource = MoviesShared.shared.movies
//                }
//                self.collectionView.reloadData()
//            }
//            self.hideActivityIndicator(view: self.view)
//            self.stopRefresher()
//        }
    }

}
