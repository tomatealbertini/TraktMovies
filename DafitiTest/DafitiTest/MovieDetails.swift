//
//  MovieDetails.swift
//  DafitiTest
//
//  Created by Tomate Albertini on 20/08/17.
//  Copyright © 2017 dafiti. All rights reserved.
//

import UIKit

class MovieDetails: Movie {
    
    var tagline:String?
    var overview:String?
    var released:String?
    var runtime:Int?
    var updated_at:String?
    var trailer:String?
    var homepage:String?
    var rating:Double?
    var votes:Int?
    var language:String?
    var available_translations:[String]?
    var genres:[String]?
    var certification:String?
    
    override init(dic:Dictionary<String,Any>) {
        
        super.init(dic: dic)
        
        if let tagline = dic["tagline"] as? String {
            self.tagline = tagline
        }
        
        if let overview = dic["overview"] as? String {
            self.overview = overview
        }
        
        if let released = dic["released"] as? String {
            self.released = released
        }
        
        if let runtime = dic["runtime"] as? Int {
            self.runtime = runtime
        }
        
        if let updated_at = dic["updated_at"] as? String {
            self.updated_at = updated_at
        }
        
        if let trailer = dic["trailer"] as? String {
            self.trailer = trailer
        }
        
        if let homepage = dic["homepage"] as? String {
            self.homepage = homepage
        }
        
        if let rating = dic["rating"] as? Double {
            self.rating = rating
        }
        
        if let votes = dic["votes"] as? Int {
            self.votes = votes
        }
        
        if let language = dic["language"] as? String {
            self.language = language
        }
        
        if let available_translations = dic["available_translations"] as? [String] {
            self.available_translations = [String]()
            for trans in available_translations {
                self.available_translations?.append(trans)
            }
        }
        
        if let genres = dic["genres"] as? [String] {
            self.genres = [String]()
            for genre in genres {
                self.genres?.append(genre)
            }
        }
        
        if let certification = dic["certification"] as? String {
            self.certification = certification
        }
    }
}
