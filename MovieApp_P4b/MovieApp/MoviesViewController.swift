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
        if m.rating > 0 {
            for _ in 1...m.rating {
                rating.append("🍿")
            }
        }
        cell.detailTextLabel?.text = rating
        
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
        
        // Do any additional setup after loading the view.
        tableView.dataSource = self
    }
}
