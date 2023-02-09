//
//  MoviesViewController.swift
//  MovieApp
//
//  Created by Haiyun on 7/3/22.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDataSource {
    // Declare an array of Movie objects
    var movieList : [Movie] = []
    
    @IBOutlet weak var tableView: UITableView!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add test data
        movieList.append(Movie(
            id: "3040",
            name: "The Batman",
            desc: "In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler.",
            rating: 4,
            image: "https://www.gv.com.sg/media/imagesresize/img3040.jpg"))
        
        movieList.append(Movie(
            id: "3073",
            name: "The Godfather (50th Anniversary)",
            desc: "Paramount Pictures celebrates the 50th Anniversary of Francis Ford Coppola’s cinematic masterpiece, made available on 4K Ultra HD for the first time ever. Coppola’s masterful film adaptation of Mario Puzo’s novel chronicles the rise and fall of the Corleone family and the film trilogy is rightfully viewed as one of the greatest films in cinematic history. The film has been meticulously restored under the direction of Coppola, over the course of three years.",
            rating: 5,
            image: "https://www.gv.com.sg/media/imagesresize/img3073.jpg"))
        
        movieList.append(Movie(
            id: "4377",
            name: "Titanic (25th Anniversary Re-Release)",
            desc: "James Cameron's \"Titanic\" is an epic, action-packed romance set against the ill-fated maiden voyage of the R.M.S. Titanic; the pride and joy of the White Star Line and, at the time, the largest moving object ever built. She was the most luxurious liner of her era -- the \"ship of dreams\" -- which ultimately carried over 1,500 people to their death in the ice cold waters of the North Atlantic in the early hours of April 15, 1912.",
            rating: 5,
            image: "https://www.gv.com.sg/media/imagesresize/img4377.jpg"))
        
        // Do any additional setup after loading the view.
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
            
            if let path = tableView.indexPathForSelectedRow {
                let movie = movieList[path.row]
                detailsViewController.movie = movie
            }
        }
    }
}
