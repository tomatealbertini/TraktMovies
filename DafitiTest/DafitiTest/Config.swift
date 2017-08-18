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
        
        enum Keys:String {
            
            case clientID     = "399afe60362c0dfe0708ccc532d9f5bc1ed2e5918a9dab56f48ea8a837bde16f"
            case clientSecret = "016789cf284b2f615cb6f7ee93368b6ad80e5822ee624efa8078bbbc64c51b08"
        }
        
        case Host = "https://api.trakt.tv/"
        // case Host = "https://api-staging.trakt.tv/"
        case redirectURI = "urn:ietf:wg:oauth:2.0:oob"
        
        // *****************************************
        // Usuários
        // *****************************************
        enum method:String
        {
            case Movie = "movies/trending"
            case authenticate = "oauth/authorize?response_type=code&client_id=%@&redirect_uri=%@"

            
            var URL: String
            {
                return "\(Config.Api.Host.rawValue)\(self.rawValue)"
            }
        }
    }
}
