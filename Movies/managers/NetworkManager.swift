
import Foundation
import Alamofire
import SwiftyJSON


class NetworkManager {
    
    func getMoviesByCategory(url : String , completion : @escaping ([JSON]) -> ()) {
        Alamofire.request(url).responseJSON { response in
            if let json = response.result.value {
                let result = JSON(json).dictionaryValue
                let movies = result["results"]?.arrayValue
                if let returnedMovies = movies {
                    completion(returnedMovies)
                }
            }
        }
    }
    
}
