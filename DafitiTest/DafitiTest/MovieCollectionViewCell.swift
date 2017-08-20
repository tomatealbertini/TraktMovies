//
//  MovieCollectionViewCell.swift
//  DafitiTest
//
//  Created by Tomate Albertini on 20/08/17.
//  Copyright © 2017 dafiti. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelName:UILabel!
    @IBOutlet weak var labelReleaseDate:UILabel!
    @IBOutlet weak var imgImage:UIImageView!
    var movie:MoviePlus?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
                    
                    print(imageMovie?.posters?.first?.urlImage())
                }
                
            })
        }
    }

}
