//
//  MoviesViewController.swift
//  MovieApp
//
//  Created by Haiyun on 7/3/22.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
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
        cell.textLabel?.text = "Movie \(indexPath.row + 1)"
        cell.detailTextLabel?.text = "🍿🍿🍿"
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
