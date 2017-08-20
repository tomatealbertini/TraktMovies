//
//  MoviesShared.swift
//  DafitiTest
//
//  Created by Tomate Albertini on 20/08/17.
//  Copyright © 2017 dafiti. All rights reserved.
//

import UIKit

final class MoviesShared {
    
    var movies:[MoviePlus] = [MoviePlus]()
    var filteredMovies:[MoviePlus] = [MoviePlus]()
    var searchTitle:String = ""
    
    static let shared = MoviesShared()
    
    func addMovies(mov:[MoviePlus]) {
        
        if self.movies.count == 0 {
            
            self.movies = [MoviePlus]()
            self.movies = mov
            
        } else {
            
            for movie in mov {
                
                self.movies.append(movie)
            }
            self.removeDuplicados()
        }
    }
    
    func removeDuplicados() {
        
        var seen = Set<Int>()
        var unique = [MoviePlus]()
        for message in self.movies {
            if !seen.contains((message.movie?.ids?.tmdb)!) {
                unique.append(message)
                seen.insert((message.movie?.ids?.tmdb!)!)
            }
        }
        
        self.movies = unique
        self.filteredMovies = moviesByName(name: self.searchTitle)
        
    }
    
    func moviesByName(name:String) -> [MoviePlus] {
        
        self.searchTitle = name
        self.filteredMovies = self.movies
        
        if searchTitle != "" {
            filteredMovies = self.movies.filter { movie in
                return (movie.movie?.title?.lowercased().contains(searchTitle.lowercased()))!
            }
        }
  
        return filteredMovies
    }
}
