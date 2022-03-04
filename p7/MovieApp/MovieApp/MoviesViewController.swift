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
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "Movies"

        // Add sample movies
        //DataManager.setupTestData()
        
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadMovies()
    }
    
    // This function reloads the movies from the Firebase
    // server. Once complete, gets the table view to
    // refresh itself.
    //
    func loadMovies()
    {
        // This is a special way to call loadMovies.
        //
        // Even if loadMovies accepts a closure as a
        // parameter, I can pass that parameter after
        // the round brackets. In a way it is
        // easier to read.
        //
        DataManager.loadMovies()
        {
            movieListFromFirebase in
            
            // This is a closure.
            //
            // This block of codes is executed when the
            // async loading from Firebase is complete.
            // What it is to reassigned the new list loaded
            // from Firebase.
            //
            self.movieList = movieListFromFirebase
            self.movieList.sort{$0.name < $1.name}
            
            // Once done, call on the Table View to reload
            // all its contents
            //
            self.tableView.reloadData()
        }
    }
    
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
        if (m.rating > 0)
        {
            for _ in 1...m.rating {
                rating.append("🍿")
            }
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let movie = movieList[indexPath.row]
            DataManager.deleteMovie(id: movie.id)
            loadMovies()
        }
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
        
        // Here we check for the AddMovie segue,
        // which is trigger by the user clicking on the +
        // button at the top of the navigation bar
        //
        if(segue.identifier == "AddMovie")
        {
            let saveMovieViewController = segue.destination as! SaveMovieViewController
            let movie = Movie(id: "", name: "", desc: "", rating: 0, image: "https://raw.githubusercontent.com/lihaiyun/ios/main/resources/popcorn.png")
            saveMovieViewController.movie = movie
        }
    }
}
