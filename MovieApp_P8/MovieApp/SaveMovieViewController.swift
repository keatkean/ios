//
//  SaveMovieViewController.swift
//  MovieApp
//
//  Created by Haiyun on 8/3/22.
//

import UIKit
import UniformTypeIdentifiers

class SaveMovieViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    var movie: Movie?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ratingTextField: UITextField!
    @IBOutlet weak var imageTextField: UITextField!
    @IBOutlet weak var descTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func imageTextEnd(_ sender: Any) {
        loadImage()
    }
    
    func loadImage() {
        if let text = imageTextField.text {
            if let imageUrl = URL(string: text) {
                loadImage(url: imageUrl)
            }
        }
    }
    
    func loadImage(url: URL) {
        DispatchQueue.global().async {
            // Fetch Image Data
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    // Create Image and Update Image View
                    self.imageView.image = UIImage(data: data)
                }
            }
            else {
                print("Invalid url")
                DispatchQueue.main.async {
                    self.imageTextField.text = ""
                    self.imageView.image = nil
                }
            }
        }
    }
    
    @IBAction func selectImagePressed(_ sender: Any) {
        let imageMediaType = UTType.image.identifier
        let pickerController = UIImagePickerController()
        pickerController.sourceType = .photoLibrary
        pickerController.mediaTypes = [imageMediaType]
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! String
        if mediaType == UTType.image.identifier {
            let imageURL = info[UIImagePickerController.InfoKey.imageURL] as! URL
            
            // Handle your logic here, e.g. uploading file to Cloud Storage for Firebase
            print("Image URL: \(imageURL)")
            FileManager.uploadFile(fileUrl: imageURL) {downloadUrl in
                self.imageTextField.text = downloadUrl.absoluteString
                self.loadImage()
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        // Validate to ensure that all the fields are
        // entered by the user. If not we show an alert.
        if nameTextField.text == "" ||
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
            let isNew = movieItem.id == ""
            
            // assign the data entered by the user into
            // the movie object
            movieItem.name = nameTextField.text!.capitalized
            movieItem.desc = descTextView.text!
            movieItem.image = imageTextField.text!
            
            let rating = Int(ratingTextField.text!)
            movieItem.rating = rating != nil ? rating! : 0
            
            // add or update movie
            if (isNew) {
                DataManager.addMovie(movie: movieItem)
            }
            else {
                DataManager.updateMovie(movie: movieItem)
            }
            
            // close this view controller and pop back out to
            // the one that shows the list of movies
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dismissKeyboard()
        
        // Do any additional setup after loading the view.
        descTextView.layer.borderWidth = 0.5
        descTextView.layer.borderColor = UIColor.lightGray.cgColor
        descTextView.layer.cornerRadius = 3
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let movieItem = movie {
            let isNew = movieItem.id == ""
            title = isNew ? "Add Movie" : "Edit Movie"
            
            nameTextField.text = movieItem.name
            ratingTextField.text = "\(movieItem.rating)"
            imageTextField.text = movieItem.image
            descTextView.text = movieItem.desc
            
            loadImage()
        }
    }
}
