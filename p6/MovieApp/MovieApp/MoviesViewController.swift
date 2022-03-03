//
//  MoviesViewController.swift
//  MovieApp
//
//  Created by HaiYun on 2/3/22.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDataSource {
    // Declare an array of Movie objects
    var movieList : [Movie] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : MovieTableViewCell = tableView.dequeueReusableCell (withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        let m = movieList[indexPath.row]
        
        // Name
        cell.nameLabel.text = m.name
        
        // Rating
        var rating = ""
        for _ in 1...m.rating {
            rating.append("🍿")
        }
        cell.ratingLabel.text = rating
        
        // Image
        let url = URL(string: m.image)!
        DispatchQueue.global().async {
            // Fetch Image Data
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    // Create Image and Update Image View
                    cell.movieImageView.image = UIImage(data: data)
                }
            }
        }
        
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "Movies"
        
        DataManager.setupTestData()
        movieList = DataManager.getMovieList()
        
        tableView.dataSource = self
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Hide Tab Bar when push
        segue.destination.hidesBottomBarWhenPushed = true
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "ShowMovieDetails")
        {
            let detailsViewController = segue.destination as! MovieDetailsViewController
            detailsViewController.hidesBottomBarWhenPushed = true
            
            if let path = tableView.indexPathForSelectedRow {
                let m = movieList[path.row]
                detailsViewController.movie = m
            }
        }
    }
}
