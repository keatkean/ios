//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by Haiyun on 8/3/22.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let m = movie {
            // Name, Description
            nameLabel.text = m.name
            descLabel.text = m.desc
            
            // Rating
            var rating = ""
            if (m.rating > 0) {
                for _ in 1...m.rating {
                    rating.append("🍿")
                }
            }
            ratingLabel.text = rating
            
            // Image
            let url = URL(string: m.image)!
            DispatchQueue.global().async {
                // Fetch Image Data
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        // Create Image and Update Image View
                        self.movieImageView.image = UIImage(data: data)
                    }
                }
            }
        }
    }
}
