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

    // Use default UITableViewCell
    /*
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // First we query the table view to see if there are
        // any UITableViewCells that can be reused. iOS will
        // create a new one if there aren't any.
        //
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        
        // Using the re-used cell, or the newly created
        // cell, we update the text label's text property.
        //
        let m = movieList[indexPath.row]
        
        cell.textLabel?.text = m.name
        
        var rating = ""
        for _ in 1...m.rating {
            rating.append("🍿")
        }
        cell.detailTextLabel?.text = rating
        
        return cell
    }
     */
    
    // Use MovieTableViewCell
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
        // Create some Movie objects and insert it into
        // the array.
        // Source: https://www.gv.com.sg/GVMovies
        
        movieList.append(Movie(
            id: "3040",
            name: "The Batman",
            desc: "In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler.",
            rating: 4,
            image: "https://www.gv.com.sg/media/imagesresize/img3040.jpg"))
        
        movieList.append(Movie(
            id: "3015",
            name: "Spencer",
            desc: "The marriage of Princess Diana and Prince Charles has long since grown cold. Though rumors of affairs and a divorce abound, peace is ordained for the Christmas festivities at the Queen’s Sandringham Estate. There's eating and drinking, shooting and hunting. Diana knows the game. But this year, things will be profoundly different. SPENCER is an imagining of what might have happened during those few fateful days.",
            rating: 5,
            image: "https://www.gv.com.sg/media/imagesresize/img3015.jpg"))
        
        movieList.append(Movie(
            id: "3073",
            name: "The Godfather (50th Anniversary)",
            desc: "Paramount Pictures celebrates the 50th Anniversary of Francis Ford Coppola’s cinematic masterpiece, made available on 4K Ultra HD for the first time ever. Coppola’s masterful film adaptation of Mario Puzo’s novel chronicles the rise and fall of the Corleone family and the film trilogy is rightfully viewed as one of the greatest films in cinematic history. The film has been meticulously restored under the direction of Coppola, over the course of three years.",
            rating: 5,
            image: "https://www.gv.com.sg/media/imagesresize/img3073.jpg"))
        
        tableView.dataSource = self
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
