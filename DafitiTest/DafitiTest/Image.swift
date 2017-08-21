//
//  Image.swift
//  DafitiTest
//
//  Created by Tomate Albertini on 20/08/17.
//  Copyright © 2017 dafiti. All rights reserved.
//

import UIKit

class Image: NSObject {
    
//    "aspect_ratio" = "0.6405228758169934";
//    "file_path" = "/tXAafJwus9nRRcJVTX8NII0rjGF.jpg";
//    height = 1377;
//    "iso_639_1" = el;
//    "vote_average" = "5.172";
//    "vote_count" = 1;
//    width = 882;
    
    var aspect_ratio:Double?
    var file_path:String?
    var height:Int?
    var iso_639_1:String?
    var vote_average:Double?
    var vote_count:Int?
    var width:Int?
    
    init(dic:Dictionary<String,Any>) {
        
        if let aspect_ratio = dic["aspect_ratio"] as? Double {
            self.aspect_ratio = aspect_ratio
        }
        
        if let file_path = dic["file_path"] as? String {
            self.file_path = file_path
        }
        
        if let height = dic["height"] as? Int {
            self.height = height
        }
        
        if let iso_639_1 = dic["iso_639_1"] as? String {
            self.iso_639_1 = iso_639_1
        }
        
        if let vote_average = dic["vote_average"] as? Double {
            self.vote_average = vote_average
        }
        
        if let vote_count = dic["vote_count"] as? Int {
            self.vote_count = vote_count
        }
        
        if let width = dic["width"] as? Int {
            self.width = width
        }
    }
    
    func urlImage() -> String {
        
        guard let path = self.file_path else {
            return ""
        }
        
        return Config.Api.HostDBImage.rawValue + path
    }
}

class Poster:Image {}

class Backdrops:Image {
}
