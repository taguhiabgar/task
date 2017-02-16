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
        // find item and save in UserDefaults
        for element in data {
            if element.albumId == item.albumId && element.id == item.id {
                let key = keyForAlbum(album: item)
                if var array = UserDefaults.standard.value(forKey: key) as? [Int] {
                    array.append(item.id)
                    UserDefaults.standard.set(array, forKey: key)
                } else {
                    let array: [Int] = [item.id]
                    UserDefaults.standard.set(array, forKey: key)
                }
                validateData()
                break
            }
        }
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
    
    private func keyForAlbum(album: Album) -> String {
        return "AlbumID: \(album.albumId)"
    }
    
    private func validateData() {
        var thereAreRemovedItems = false
        var index = 0
        while index < data.count {
            let idArray = UserDefaults.standard.value(forKey: keyForAlbum(album: data[index])) as? [Int]
            if idArray != nil {
                for id in idArray! {
                    if id == data[index].id {
                        data.remove(at: index)
                        thereAreRemovedItems = true
                    }
                }
            }
            index += 1
        }
        if thereAreRemovedItems {
            self.delegate?.updateData()
        }
    }
    
}
