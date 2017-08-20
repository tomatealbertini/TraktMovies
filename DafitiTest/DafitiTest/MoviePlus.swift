//
//  MoviePlus.swift
//  DafitiTest
//
//  Created by Tomate Albertini on 18/08/17.
//  Copyright © 2017 dafiti. All rights reserved.
//

import UIKit

class MoviePlus: NSObject {

    var watchers:Int?
    var movie:Movie?
    
    init(dic:Dictionary<String,Any>) {
        
        if let watchers = dic["watchers"] as? Int {
            self.watchers = watchers
        }
        
        if let movie = dic["movie"] as? Dictionary<String,Any> {
            self.movie = Movie(dic: movie)
        }
    }
}
