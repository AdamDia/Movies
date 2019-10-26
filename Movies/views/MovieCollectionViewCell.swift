

import UIKit
import SDWebImage

class MovieCollectionViewCell: UICollectionViewCell {
    
    var movieCellViewModel : MovieViewModel? {
        didSet {
            let movie = movieCellViewModel?.movie ?? Movie()
            self.moviePoster?.sd_setImage(with: URL(string: "\(Constants.imageBaseUrl)\(movie.posterPath)") , completed: nil)
            
        }
    }

    @IBOutlet weak var moviePoster: UIImageView!
    override func awakeFromNib() {
        
        
        super.awakeFromNib()
        // Initialization code
    }

}
