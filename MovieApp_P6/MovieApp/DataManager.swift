//
//  DataManager.swift
//  MovieApp
//
//  Created by Haiyun on 8/3/22.
//

import UIKit

class DataManager: NSObject {
    static var movieDict : [String: Movie] = [:]
    
    static func saveMovie(movie: Movie) {
        movieDict[movie.id] = movie
    }
    
    static func deleteMovie(id:String) {
        movieDict.removeValue(forKey: id)
    }
    
    static func getMovieList() -> [Movie] {
        let movieList = Array(movieDict.values)
        return movieList
    }
    
    static func addTestData() {
        // Source: https://www.gv.com.sg/GVMovies
        saveMovie(movie:Movie(
            id: "3040",
            name: "The Batman",
            desc: "In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler.",
            rating: 4,
            image: "https://www.gv.com.sg/media/imagesresize/img3040.jpg"))
        
        saveMovie(movie:Movie(
            id: "3073",
            name: "The Godfather (50th Anniversary)",
            desc: "Paramount Pictures celebrates the 50th Anniversary of Francis Ford Coppola’s cinematic masterpiece, made available on 4K Ultra HD for the first time ever. Coppola’s masterful film adaptation of Mario Puzo’s novel chronicles the rise and fall of the Corleone family and the film trilogy is rightfully viewed as one of the greatest films in cinematic history. The film has been meticulously restored under the direction of Coppola, over the course of three years.",
            rating: 5,
            image: "https://www.gv.com.sg/media/imagesresize/img3073.jpg"))
        
        saveMovie(movie:Movie(
            id: "4377",
            name: "Titanic (25th Anniversary Re-Release)",
            desc: "James Cameron's \"Titanic\" is an epic, action-packed romance set against the ill-fated maiden voyage of the R.M.S. Titanic; the pride and joy of the White Star Line and, at the time, the largest moving object ever built. She was the most luxurious liner of her era -- the \"ship of dreams\" -- which ultimately carried over 1,500 people to their death in the ice cold waters of the North Atlantic in the early hours of April 15, 1912.",
            rating: 5,
            image: "https://www.gv.com.sg/media/imagesresize/img4377.jpg"))
    }
}
