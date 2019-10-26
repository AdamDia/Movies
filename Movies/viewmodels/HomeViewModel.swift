

import Foundation


class HomeViewModel {
    
    
    let networkManager = NetworkManager()
    let viewModel = CategoryMoviesViewModel()
    let viewModel2 = CategoryMoviesViewModel()
    let viewModel3 = CategoryMoviesViewModel()
    let viewModel4 = CategoryMoviesViewModel()
    
    
    
    func getCategoryViewModel(position : Int) -> CategoryMoviesViewModel {
        
        switch position {
            case 0:
                viewModel.category = "Top Rated"
                return viewModel
            case 1 :
                viewModel2.category = "Popular Movies"
                return viewModel2
            case 2 :
                viewModel3.category = "Now Playing"
                return viewModel3
            case 3 :
                viewModel4.category = "Upcoming Movies"
                return viewModel4
            default:
                return viewModel
        }
        
    }
    
    
    func getMoviesByCategory(position : Int ,url : String , completion : @escaping () -> ()) {
        
        networkManager.getMoviesByCategory(url: url) { (json) in
            json.forEach({ jsonMovie in
                let id = jsonMovie["id"].intValue
                let title = jsonMovie["title"].stringValue
                let posterPath = jsonMovie["poster_path"].stringValue
                let overview = jsonMovie["overview"].stringValue
                let rate = jsonMovie["vote_average"].doubleValue
                
                let movie = Movie()
                movie.id = id
                movie.title = title
                movie.posterPath = posterPath
                movie.overview = overview
                movie.rate = rate
                if (position == 0) {
                    self.viewModel.movies.append(movie)
                } else if (position == 1) {
                    self.viewModel2.movies.append(movie)
                } else if (position == 2) {
                    self.viewModel3.movies.append(movie)
                } else if (position == 3) {
                    self.viewModel4.movies.append(movie)
                }
            })
            completion()
            
        }
        
    }
    
    
    
    
    
}
