//
//  Extensions.swift
//  Task
//
//  Created by Taguhi Abgaryan on 2/15/17.
//  Copyright © 2017 Taguhi Abgaryan. All rights reserved.
//

import UIKit
import Alamofire

extension UIImageView {
//    public func imageFromUrl(url: String) {
//        if let newurl = URL(string: url) {
//            let request = URLRequest(url: newurl)
//            NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue.main) {
//                (response: URLResponse?, data: Data?, error: Error?) -> Void in
//                if let imageData = data as Data? {
//                    self.image = UIImage(data: imageData as Data)
//                }
//            }
//        }
//    }
//    
//    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
//        contentMode = mode
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard
//                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
//                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
//                let data = data, error == nil,
//                let image = UIImage(data: data)
//                else {
//                    self.image = placeholderImage
//                    return
//            }
//            DispatchQueue.main.async() { () -> Void in
//                self.image = image
//            }
//            }.resume()
//    }
//    
//    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
//        guard let url = URL(string: link) else { return }
//        downloadedFrom(url: url, contentMode: mode)
//    }
//
        public func imageFromUrl(url: String) {
            URLSession.shared.dataTask(with: NSURL(string: url)! as URL, completionHandler: { (data, response, error) -> Void in
                if error != nil {
                    print(error ?? "error")
                    return
                }
                DispatchQueue.main.async(execute: { () -> Void in
                    let image = UIImage(data: data!)
                    self.image = image
                })
            }).resume()
        }
    
    
//    public func imageFromUrl(url: String) {
//        let imageUrlString = url
//        guard let imageUrl = URL(string: imageUrlString) else {
//            self.image = placeholderImage
//            return
//        }
//        // Start background thread so that image loading does not make app unresponsive
//        DispatchQueue.global(qos: .userInitiated).async {
//            guard let imageData: NSData = NSData(contentsOf: imageUrl) else {
//                self.image = placeholderImage
//                return
//            }
//            DispatchQueue.main.async {
//                guard let image = UIImage(data: imageData as Data) else {
//                    self.image = placeholderImage
//                    return
//                }
//                self.image = image
//            }
//        }
//    }
    
        
//        Alamofire.request(url).response { (response) in
//            guard let imageData = response.data else {
//                self.image = placeholderImage
//                return
//            }
//            if let image = UIImage(data: imageData) {
//                self.image = image
//            } else {
//                self.image = placeholderImage
//            }
//        }
        
//        let nsurl = NSURL(string: url)!
//        let session = URLSession.shared
//        
//        let task = session.dataTask(with: nsurl as URL) { data, response, error in
//            if data != nil {
//                self.image = UIImage(data: data!)
//            }
//        }
//        task.resume()
        
        
        
        
        
//        let sessionTask = URLSession.shared
//        let request = URLRequest(url: URL(fileURLWithPath: url))
//        let task = sessionTask.dataTask(with: request, completionHandler: {(data: Data?, response: URLResponse?, error: Error?) -> Void in
//            if (error == nil) {
//                let image: UIImage = UIImage(data: data!)!
//                completionBlock(true, image)
//            }
//            else {
//                completionBlock(false, UIImage(named: "user_icon")!)
//            }
//        })
//        task.resume()
        
        
        
        
//        if NSURL(string: urlString) != nil {
//            Alamofire.request(urlString).responseData(queue: nil, completionHandler: {
//                data in
//                let image = UIImage(data: data.data!)
//                self.image = image
//            })
//        }
    
}
