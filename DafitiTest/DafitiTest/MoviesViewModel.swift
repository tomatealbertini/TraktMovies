//
//  MoviesViewModel.swift
//  DafitiTest
//
//  Created by Omni - Desenvolvimento on 20/03/18.
//  Copyright © 2018 dafiti. All rights reserved.
//

import UIKit

class MoviesViewModel: NSObject {

    @objc dynamic var moviesDataSource:[MoviePlus] = [MoviePlus]()
    private var movies:[MoviePlus] = [MoviePlus]()
    private var filteredMovies:[MoviePlus] = [MoviePlus]()
    private var searchTitle:String = ""
    
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
        for m in self.movies {
            if !seen.contains((m.movie?.ids?.tmdb)!) {
                unique.append(m)
                seen.insert((m.movie?.ids?.tmdb!)!)
            }
        }
        self.movies = unique
        moviesByName(name: self.searchTitle)
    }
    
    func moviesByName(name:String) {
        
        self.searchTitle = name
        self.filteredMovies = self.movies
        
        if searchTitle != "" {
            filteredMovies = self.movies.filter { movie in
                return (movie.movie?.title?.lowercased().contains(searchTitle.lowercased()))!
            }
        }
        self.moviesDataSource = filteredMovies
    }
    
    func favoritesMovies() -> [MoviePlus] {
        return self.movies.filter({ FavoritesManager.shared.favoriteAlreadyExists(ids: ($0.movie?.ids)!) == true })
    }
    
    func getTrendingMoview(origem:origemDados, onSuccessComplete:@escaping ()->()) {
        
        Control.getTrendindMovies { (result, erro) in
            
            if erro == nil {
                
                self.addMovies(mov: result!)
      
                    switch origem {
                    case .Home:
                        self.moviesDataSource = self.movies
                    case .Busca:
                        self.moviesDataSource = self.filteredMovies
                    case .Favoritos:
                        self.moviesDataSource = self.favoritesMovies()
                }
                onSuccessComplete()
            }
        }
    }
}
