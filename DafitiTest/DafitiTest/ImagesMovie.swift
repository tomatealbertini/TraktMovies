//
//  ImagesMovie.swift
//  DafitiTest
//
//  Created by Tomate Albertini on 20/08/17.
//  Copyright © 2017 dafiti. All rights reserved.
//

import UIKit

class ImagesMovie: NSObject {
    
    var backdrops:[Backdrops]?
    var posters:[Poster]?
    
    init (dic:Dictionary<String,Any>) {
        
        if let back = dic["backdrops"] as? Array<Dictionary<String,Any>> {
            
            backdrops = [Backdrops]()
            
            for b in back {
                backdrops?.append(Backdrops(dic: b))
            }
        }
        
        if let post = dic["posters"] as? Array<Dictionary<String,Any>> {
            
            posters = [Poster]()
            
            for p in post {
                posters?.append(Poster(dic: p))
            }
        }
    }
}
