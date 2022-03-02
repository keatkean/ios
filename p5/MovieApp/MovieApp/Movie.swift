//
//  Movie.swift
//  MovieApp
//
//  Created by HaiYun on 2/3/22.
//

import UIKit

class Movie : NSObject {
    var name: String
    var desc: String
    var rating: Int
    var image: String
    
    init(name: String, desc: String, rating: Int, image: String)
    {
        self.name = name
        self.desc = desc
        self.rating = rating
        self.image = image
    }
}
