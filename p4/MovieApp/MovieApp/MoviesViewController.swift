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
        // First we query the table view to see if there are
        // any UITableViewCells that can be reused. iOS will
        // create a new one if there aren't any.
        //
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "MovieCell", for: indexPath)
        
        // Using the re-used cell, or the newly created
        // cell, we update the text label's text property.
        //
        let movie = movieList[indexPath.row]
        cell.textLabel?.text = movie.name
        
        var stars = ""
        for _ in 1...movie.rating {
            stars.append("⭐")
        }
        cell.detailTextLabel?.text = stars
        
        return cell
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // Create some Movie objects and insert it into
        // the array.
        //
        movieList.append(Movie(
            name: "The Batman",
            desc: "In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler.",
            rating: 5,
            image: "https://www.gv.com.sg/media/imagesresize/img3040.jpg"))
        
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
