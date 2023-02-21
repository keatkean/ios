//
//  FileManager.swift
//  MovieApp
//
//  Created by HaiYun on 21/2/23.
//

import UIKit
import FirebaseStorage

class FileManager: NSObject {
    
    static func uploadFile(fileUrl: URL, onComplete: @escaping ((URL) -> Void)) {
        // Create file name
        let uuid = UUID().uuidString
        let fileExtension = fileUrl.pathExtension
        let fileName = "\(uuid).\(fileExtension)"
        
        let storageReference = Storage.storage().reference().child(fileName)
        _ = storageReference.putFile(from: fileUrl, metadata: nil) { (storageMetaData, error) in
            if let error = error {
                print("Upload error: \(error.localizedDescription)")
                return
            }
            print("Image file: \(fileName) is uploaded!")
            
            storageReference.downloadURL { (url, error) in
                if let error = error  {
                    print("Error on getting download url: \(error.localizedDescription)")
                    return
                }
                print("Download url of \(fileName) is \(url!.absoluteString)")
                onComplete(url!)
            }
        }
    }
}
