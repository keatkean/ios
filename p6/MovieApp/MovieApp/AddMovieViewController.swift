//
//  AddMovieViewController.swift
//  MovieApp
//
//  Created by HaiYun on 3/3/22.
//

import UIKit

class AddMovieViewController: UIViewController {
    
    var movie: Movie?
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ratingTextField: UITextField!
    @IBOutlet weak var imageTextField: UITextField!
    @IBOutlet weak var descTextView: UILabel!
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        // Validate to ensure that all the fields are
        // entered by the user. If not we show an alert.
        //
        if idTextField.text == "" ||
            nameTextField.text == "" ||
            descTextView.text == "" ||
            imageTextField.text == "" ||
            ratingTextField.text == ""
        {
            let alert = UIAlertController(
                title: "Please enter all fields",
                message: "",
                preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "OK",
                                          style: UIAlertAction.Style.default,
                                          handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if let movieItem = movie {
            // assign the data entered by the user into
            // the movie object
            //
            movieItem.id = idTextField.text!
            movieItem.name = nameTextField.text!
            movieItem.desc = descTextView.text!
            movieItem.image = imageTextField.text!
            
            let rating = Int(ratingTextField.text!)
            movieItem.rating = rating != nil ? rating! : 1
            
            // Execute the SQL to insert the data
            // into the database
            //
            DataManager.addMovie(movie: movieItem)
            
            // Calls the root view controller's table view to
            // to refresh itself.
            //
            let parent = self.navigationController?.viewControllers[0] as! MoviesViewController
            parent.movieList = DataManager.getMovieList()
            parent.tableView?.reloadData()
            
            // close this view controller and pop back out to
            // the one that shows the list of movies.
            //
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
