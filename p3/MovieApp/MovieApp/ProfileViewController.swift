//
//  ProfileViewController.swift
//  MovieApp
//
//  Created by HaiYun on 1/3/22.
//

import UIKit

class ProfileViewController: UIViewController, UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // Declare a string array that will contain
    // the texts that we want to display in our
    // picker view.
    //
    var pickerData : [String] = [
        "English",
        "Chinese",
        "Malay",
        "Tamil"
    ]
    
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
