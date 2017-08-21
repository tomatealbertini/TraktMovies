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
    //galeria
    
    
    var movieDetails:MovieDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUp()
    }
    
    func setUp() {
        
        self.lTitle.text = self.movieDetails?.title
        self.lReleaseDate.text = self.movieDetails?.released
        self.lRuntime.text = "\(self.movieDetails!.runtime!)"
        self.lTagline.text = self.movieDetails?.tagline
        self.lOverview.text = self.movieDetails?.overview
        self.lRating.text =  String(format:"%.1f",self.movieDetails!.rating!)
        self.lGenres.text = self.movieDetails?.genres?.joined(separator: ", ")
    }
    
    @IBAction func close(sender:UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
