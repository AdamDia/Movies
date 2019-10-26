//
//  CategoryMoviesViewModel.swift
//  Movies
//
//  Created by Abdelrahman Hesham on 3/30/19.
//  Copyright © 2019 Abdelrahman Hesham. All rights reserved.
//

import Foundation



class CategoryMoviesViewModel {
    
    var category : String = ""
    var movies : [Movie] = [Movie]()
    
    
    
    
    func getMovieViewModel(position : Int) -> MovieViewModel {
        let viewModel = MovieViewModel()
        viewModel.movie = movies[position]
        
        return viewModel
    }
    
    
    func getMoviesCount() -> Int {
        return movies.count
    }
    
    
}
