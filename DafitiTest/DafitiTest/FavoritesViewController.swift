//
//  FavoritesViewController.swift
//  DafitiTest
//
//  Created by Tomate Albertini on 22/08/17.
//  Copyright © 2017 dafiti. All rights reserved.
//

import UIKit

class FavoritesViewController: HomeViewController {

    @IBOutlet weak var lMessage: UILabel!


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.getMovies()
        super.loadData()
    }
    
    override func getMovies() {
        
        self.showActivityIndicator(view: self.view, withOpaqueOverlay: true)
        self.viewModel.getTrendingMoview(origem: .Favoritos) {
            self.lMessage.isHidden = self.viewModel.moviesDataSource.count != 0
        }
    }
    
//    override func loadData() {
//
//        self.showActivityIndicator(view: self.view, withOpaqueOverlay: true)
//
//        Control.getTrendindMovies { (result, erro) in
//
//            if erro == nil {
//
//                MoviesShared.shared.addMovies(mov: result!)
//
//                self.moviesDataSource = MoviesShared.shared.favoritesMovies()
//
//                self.collectionView.reloadData()
//
//                if self.moviesDataSource.count == 0 {
//
//                    self.lMessage.isHidden = false
//
//                } else {
//
//                    self.lMessage.isHidden = true
//                }
//            }
//            self.hideActivityIndicator(view: self.view)
//            self.stopRefresher()
//        }
//    }
}
