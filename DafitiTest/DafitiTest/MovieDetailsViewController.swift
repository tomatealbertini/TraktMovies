//
//  MovieDetailsViewController.swift
//  DafitiTest
//
//  Created by Tomate Albertini on 20/08/17.
//  Copyright © 2017 dafiti. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var lTitle:UILabel!
    @IBOutlet weak var lReleaseDate:UILabel!
    @IBOutlet weak var lRuntime:UILabel!
    @IBOutlet weak var lTagline:UILabel!
    @IBOutlet weak var lOverview:UILabel!
    @IBOutlet weak var lRating:UILabel!
    @IBOutlet weak var lGenres:UILabel!
    @IBOutlet weak var scroll:UIScrollView!
    //galeria
    
    
    var movieDetails:MovieDetails?
    var imageMovie:ImagesMovie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUp()
        self.checkIfImageMoviesLoaded()
    }
     
    func showImages() {
        
        var offset = 0
    
        for backdrop in (self.imageMovie?.backdrops)! {

            let url = URL(string: (backdrop.urlImage()))
            
            let imageView = UIImageView(frame: CGRect(x: offset, y: 0, width: 225, height: 128))
            imageView.kf.setImage(with: url)
            
            self.scroll.addSubview(imageView)
            offset += 230
        }
        
        self.scroll.contentSize = CGSize(width: (self.imageMovie?.backdrops?.count)! * 230, height: 128)
    }
    
    func tapImage()
    
    func setUp() {
        
        self.lTitle.text = self.movieDetails?.title
        self.lReleaseDate.text = self.movieDetails?.released
        self.lRuntime.text = "\(self.movieDetails!.runtime!)"
        self.lTagline.text = self.movieDetails?.tagline
        self.lOverview.text = self.movieDetails?.overview
        self.lRating.text =  String(format:"%.1f",self.movieDetails!.rating!)
        self.lGenres.text = self.movieDetails?.genres?.joined(separator: ", ")
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
    
    @IBAction func close(sender:UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
