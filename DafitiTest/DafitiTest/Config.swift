//
//  Config.swift
//  DafitiTest
//
//  Created by Tomate Albertini on 18/08/17.
//  Copyright © 2017 dafiti. All rights reserved.
//

import UIKit


enum Config
{
    enum Api:String {
        
        //Keys
        enum Keys:String {
            
            case clientID      = "399afe60362c0dfe0708ccc532d9f5bc1ed2e5918a9dab56f48ea8a837bde16f"
            case clientSecret  = "016789cf284b2f615cb6f7ee93368b6ad80e5822ee624efa8078bbbc64c51b08"
            case themoviedbKey = "ae61ad33d07bb0b2e53c15800d6b356a"
        }
        
        //URL
        // case Host = "https://api-staging.trakt.tv/"
        case HostTrakt    = "https://api.trakt.tv/"
        case HostDBMovies = "https://api.themoviedb.org/3/movie"
        case HostDBImage  = "https://image.tmdb.org/t/p/w1000"
        case HostDBImages = "https://api.themoviedb.org/3/movie/%d/images?api_key=%@"
        case redirectURI  = "urn:ietf:wg:oauth:2.0:oob"
        

        // Métodos
        enum method:String {
            
            case Movie = "movies/trending"
            case MovieDetails = "movies/%d?extended=full"
            
            var URL: String
            {
                return "\(Config.Api.HostTrakt.rawValue)\(self.rawValue)"
            }
        }
    }
}
