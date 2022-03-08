//
//  ProfileViewController.swift
//  MovieApp
//
//  Created by HaiYun on 1/3/22.
//

import UIKit

class ProfileViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBAction func buttonPressed(_ sender: Any) {
        // Here, find out which row in the 1st component
        // was selected by the user.
        //
        let row = pickerView.selectedRow(inComponent: 0)
        
        // Then, we get the actual data from our
        // pickerData array.
        //
        let selectedText = pickerData[row]
        
        // Then, we show an alert with the selected data
        //
        let uiAlert = UIAlertController(
            title: "You selected \(selectedText)",
            message: "Thank you",
            preferredStyle: .alert)
        
        uiAlert.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil))
        
        // After configuring the alert controller,
        // you must present it like this:
        //
        self.present(uiAlert, animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
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
        pickerView.dataSource = self
        pickerView.delegate = self
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
