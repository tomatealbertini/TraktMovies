//
//  MovieCollectionViewCell.swift
//  DafitiTest
//
//  Created by Tomate Albertini on 20/08/17.
//  Copyright © 2017 dafiti. All rights reserved.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelName:UILabel!
    @IBOutlet weak var labelReleaseDate:UILabel!
    @IBOutlet weak var imgImage:UIImageView!
    @IBOutlet weak var vContainer:UIView!
    
    var movie:MoviePlus?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.vContainer.layer.cornerRadius = 6
        self.vContainer.clipsToBounds = true
    }
    
    func loadData() {
        
        if let title = self.movie?.movie?.title {
            self.labelName.text = title
        }
        
        if let year = self.movie?.movie?.year {
            self.labelReleaseDate.text = "\(year)"
        }
        
        if let tmdb = self.movie?.movie?.ids?.tmdb {
            
            Control.getImages(imbdID: tmdb, completion: { (imageMovie, erroString) in
                
                if erroString == nil {
                    
                    let url = URL(string: (imageMovie?.posters?.first?.urlImage())!)
                    self.imgImage.kf.setImage(with: url)
                    
                }
            })
        }
    }

}
