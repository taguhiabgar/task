//
//  Data.swift
//  Task
//
//  Created by Taguhi Abgaryan on 2/14/17.
//  Copyright © 2017 Taguhi Abgaryan. All rights reserved.
//

import UIKit
import Alamofire

protocol DataManagerDelegate {
    func updateData()
}

class DataManager {
    
    // MARK: - Static Properties
    
    static let shared = DataManager()
    
    // MARK: - Public Properties
    
    public var data: Array<Album> = [] {
        didSet {
            validateData()
        }
    }
    public var delegate: DataManagerDelegate? = nil
    
    // MARK: - Public Methods
    
    public func requestData(url: String) {
        var jsonArray: Array<Album> = []
        Alamofire.request(url).responseJSON { (responseObject) -> Void in
            jsonArray = self.convertToDictionary(response: responseObject)
            } .responseJSON(completionHandler: { _ in
                self.data = jsonArray
                self.delegate?.updateData()
            }
        )
    }
    
    public func remove(item: Album) {
        
        
        
        
        print("not implemented: remove(item: Album)")
    }
    
    // MARK: - Private Methods
    
    private func convertToDictionary(response: DataResponse<Any>) -> Array<Album> {
        let array = response.result.value as! Array<Dictionary<String, Any>>
        var result: Array<Album> = []
        for item in array {
            result.append(Album(album: item))
        }
        return result
    }
    
    private func validateData() {
        
        print("I'm not implemented :P")
    }
    
}
