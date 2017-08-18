//
//  Ids.swift
//  DafitiTest
//
//  Created by Tomate Albertini on 18/08/17.
//  Copyright © 2017 dafiti. All rights reserved.
//

import UIKit

class Ids: NSObject {

    var trakt:Int?
    var slug:String?
    var imdb:String?
    var tmdb:Int?
    
    init(dic:Dictionary<String,Any>) {
        
        if let trakt = dic["trakt"] as? Int {
            self.trakt = trakt
        }
        if let slug = dic["slug"] as? String {
            self.slug = slug
        }
        if let imdb = dic["imdb"] as? String {
            self.imdb = imdb
        }
        if let tmdb = dic["tmdb"] as? Int {
            self.tmdb = tmdb
        }
    }
}
