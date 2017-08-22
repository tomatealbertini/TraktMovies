//
//  FavoritesManager.swift
//  DafitiTest
//
//  Created by Tomate Albertini on 22/08/17.
//  Copyright © 2017 dafiti. All rights reserved.
//

import UIKit

final class FavoritesManager {

    static let shared = FavoritesManager()
    
    let userdefaults = UserDefaults.standard
    
    func addFavorite(ids:Ids) -> Bool {
        
        if favoriteAlreadyExists(ids: ids) {
            removeFavorite(ids: ids)
            return false
        } else {
            userdefaults.set(ids.imdb!, forKey: ids.imdb!)
            return true
        }
    }
    
    func removeFavorite(ids:Ids) {
        
        userdefaults.removeObject(forKey: ids.imdb!)
    }
    
    func favoriteAlreadyExists(ids:Ids) -> Bool {
        
        if let _ = userdefaults.value(forKey: ids.imdb!) {
            return true
        } else {
            return false
        }
    }
}
