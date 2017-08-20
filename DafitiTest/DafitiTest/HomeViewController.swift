//
//  HomeViewController.swift
//  DafitiTest
//
//  Created by Tomate Albertini on 18/08/17.
//  Copyright © 2017 dafiti. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    let reuseIdentifier = "MovieCollectionViewCell"
    let itensPerRow:CGFloat = 2
    let sectionInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
    let itemHeight:CGFloat = 50
    
    @IBOutlet weak var collectionView:UICollectionView!
    
    var movies:[MoviePlus]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        let layout = HomeProgramsLayout()
        layout.itemSize = CGSize(width: self.view.bounds.width / 2, height: itemHeight)
        layout.minimumLineSpacing = 0
        
        self.collectionView.setCollectionViewLayout(layout, animated: false)
        self.collectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        Control.getTrendindMovies { (result, erro) in
            
            if erro == nil {
                self.movies = result
                self.collectionView.reloadData()
            }
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MovieCollectionViewCell
        cell.movie = self.movies?[indexPath.row]
        cell.loadData()
//        cell.backgroundColor = UIColor.black

//        cell.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        return cell
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let count = self.movies?.count {
            return  count
        } else {
            return 0
        }
    }
}

