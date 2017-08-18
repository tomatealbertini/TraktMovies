//
//  Movie.swift
//  DafitiTest
//
//  Created by Tomate Albertini on 18/08/17.
//  Copyright © 2017 dafiti. All rights reserved.
//

import UIKit

class Movie: NSObject {
    
    var ids:Ids?
    var title:String?
    var year:Int?
    
    init(dic:Dictionary<String,Any>) {
        
        if let ids = dic["ids"] as? Dictionary<String,Any> {
            self.ids = Ids(dic: ids)
        }
        
        if let title = dic["title"] as? String {
            self.title = title
        }

        if let year = dic["year"] as? Int {
            self.year = year
        }
    }
}
