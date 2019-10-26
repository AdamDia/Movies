

import UIKit

class CategoryMoviesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    var cellViewModel : CategoryMoviesViewModel? {
        didSet {
            category.text = cellViewModel?.category
            moviesCollectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        moviesCollectionView.dataSource = self
        moviesCollectionView.delegate = self
        
        let movieNib = UINib(nibName: "MovieCollectionViewCell", bundle: nil)
        moviesCollectionView.register(movieNib, forCellWithReuseIdentifier: "movieCell")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}


extension CategoryMoviesTableViewCell : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModel?.getMoviesCount() ?? 0;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCollectionViewCell
        
        
        cell.movieCellViewModel = cellViewModel?.getMovieViewModel(position: indexPath.row)
        
        
        return cell
    }
    
    
}

extension CategoryMoviesTableViewCell : UICollectionViewDelegate {
    
}

extension CategoryMoviesTableViewCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.bounds.size.width
        let height = self.bounds.size.height
        
        
        
        let orientation = UIApplication.shared.statusBarOrientation
        if (orientation == .landscapeLeft || orientation == .landscapeRight)
        {
            return CGSize(width: width / 3 - 1 , height: height)
        }
        else {
            return CGSize(width: width / 3 - 1 , height: height)
        }
    }
}
