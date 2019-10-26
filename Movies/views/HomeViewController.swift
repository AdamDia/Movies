

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let homeViewModel = HomeViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel.getMoviesByCategory(position : 0 ,url: Constants.topRatedUrl + "1") {
            self.homeViewModel.getMoviesByCategory(position : 1 , url: Constants.popularUrl + "1", completion: {
                self.homeViewModel.getMoviesByCategory(position : 2 , url: Constants.nowPlayingUrl + "1", completion: {
                    self.homeViewModel.getMoviesByCategory(position : 3 , url: Constants.upcomingUrl + "1", completion: {
                        self.tableView.reloadData()
                    })
                })
            })
        }
        
        
        let moviesCategory = UINib(nibName: "CategoryMoviesTableViewCell", bundle: nil)
        tableView.register(moviesCategory, forCellReuseIdentifier: "categoryMovies")
    }


}



extension HomeViewController : UITableViewDelegate {
    
}

extension HomeViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryMovies", for: indexPath) as! CategoryMoviesTableViewCell
        
        cell.cellViewModel = homeViewModel.getCategoryViewModel(position: indexPath.row)
        
        return cell
    }
    
    
}

