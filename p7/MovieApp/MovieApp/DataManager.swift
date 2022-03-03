//
//  DataManager.swift
//  MovieApp
//
//  Created by HaiYun on 3/3/22.
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
        var movieList = Array(movieDict.values)
        movieList.sort{$0.name < $1.name}
        return movieList
    }
    
    static func setupTestData() {
        movieDict = [:]
        
        // Source: https://www.gv.com.sg/GVMovies
        saveMovie(movie:Movie(
            id: "3040",
            name: "The Batman",
            desc: "In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler.",
            rating: 4,
            image: "https://www.gv.com.sg/media/imagesresize/img3040.jpg"))
        
        saveMovie(movie:Movie(
            id: "3015",
            name: "Spencer",
            desc: "The marriage of Princess Diana and Prince Charles has long since grown cold. Though rumors of affairs and a divorce abound, peace is ordained for the Christmas festivities at the Queen’s Sandringham Estate. There's eating and drinking, shooting and hunting. Diana knows the game. But this year, things will be profoundly different. SPENCER is an imagining of what might have happened during those few fateful days.",
            rating: 5,
            image: "https://www.gv.com.sg/media/imagesresize/img3015.jpg"))
        
        saveMovie(movie:Movie(
            id: "3073",
            name: "The Godfather (50th Anniversary)",
            desc: "Paramount Pictures celebrates the 50th Anniversary of Francis Ford Coppola’s cinematic masterpiece, made available on 4K Ultra HD for the first time ever. Coppola’s masterful film adaptation of Mario Puzo’s novel chronicles the rise and fall of the Corleone family and the film trilogy is rightfully viewed as one of the greatest films in cinematic history. The film has been meticulously restored under the direction of Coppola, over the course of three years.",
            rating: 5,
            image: "https://www.gv.com.sg/media/imagesresize/img3073.jpg"))
    }
}
