//
//  MovieDetailsViewController.swift
//  DafitiTest
//
//  Created by Tomate Albertini on 20/08/17.
//  Copyright © 2017 dafiti. All rights reserved.
//

import UIKit

class MovieDetailsViewController: BaseViewController {

    @IBOutlet weak var lTitle:UILabel!
    @IBOutlet weak var lReleaseDate:UILabel!
    @IBOutlet weak var lRuntime:UILabel!
    @IBOutlet weak var lTagline:UILabel!
    @IBOutlet weak var lOverview:UILabel!
    @IBOutlet weak var lRating:UILabel!
    @IBOutlet weak var lGenres:UILabel!
    @IBOutlet weak var scroll:UIScrollView!
    @IBOutlet weak var btClose: UIButton!
    @IBOutlet weak var btFavorite: UIButton!
    
    var movieDetails:MovieDetails?
    var imageMovie:ImagesMovie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUp()
        self.checkIfImageMoviesLoaded()
    }
     
    func showImages() {
        
        var offsetX = 0
    
        for backdrop in (self.imageMovie?.backdrops)! {

            let url = URL(string: (backdrop.urlImage()))
            let tap = UITapGestureRecognizer(target: self, action: #selector(tapImage(tapGestureRecognizer:)))
            
            let imageView = UIImageView(frame: CGRect(x: offsetX, y: 0, width: 225, height: 128))
            imageView.kf.setImage(with: url)
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(tap)
            
            self.scroll.addSubview(imageView)
            
            offsetX += 230
        }
        
        self.scroll.contentSize = CGSize(width: (self.imageMovie?.backdrops?.count)! * 230, height: 128)
    }
    
    func tapImage(tapGestureRecognizer: UITapGestureRecognizer) {
        
        if let imageView = tapGestureRecognizer.view as? UIImageView {
       
            let st = UIStoryboard.init(name: "Main", bundle: nil)
            let controller = st.instantiateViewController(withIdentifier: "ImageZoomViewController") as! ImageZoomViewController
            controller.imageFromDetails = imageView.image
            
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    func setUp() {
        
        self.lTitle.text = self.movieDetails?.title
        self.lReleaseDate.text = self.movieDetails?.released
        self.lRuntime.text = "\(self.movieDetails!.runtime!)"
        self.lTagline.text = self.movieDetails?.tagline
        self.lOverview.text = self.movieDetails?.overview
        self.lRating.text =  String(format:"%.1f",self.movieDetails!.rating!)
        self.lGenres.text = self.movieDetails?.genres?.joined(separator: ", ")
        
        self.btClose.changeButtonImageColor(to: UIColor.white)
        
        if FavoritesManager.shared.favoriteAlreadyExists(ids: movieDetails!.ids!) {
            
            btFavorite.changeButtonImageColor(to: .red)
        } else {
            btFavorite.changeButtonImageColor(to: .white)
        }
    }
    
    func checkIfImageMoviesLoaded() {
        
        if self.imageMovie == nil {
            
            if let tmdb = self.movieDetails?.ids?.tmdb {
                
                Control.getImages(imbdID: tmdb, completion: { (imageMovie, erroString) in
                    
                    if erroString == nil {
                        
                        self.imageMovie = imageMovie!
                    }
                })
            }
        } else {
            self.showImages()
        }
    }
    
    @IBAction func favorite(sender:UIButton) {
        
        if FavoritesManager.shared.addFavorite(ids: movieDetails!.ids!) {
        
            btFavorite.changeButtonImageColor(to: .red)
        } else {
            btFavorite.changeButtonImageColor(to: .white)
        }
    }
    
    @IBAction func close(sender:UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
