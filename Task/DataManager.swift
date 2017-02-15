//
//  Data.swift
//  Task
//
//  Created by Taguhi Abgaryan on 2/14/17.
//  Copyright © 2017 Taguhi Abgaryan. All rights reserved.
//

import Foundation
import Alamofire

protocol DataManagerDelegate {
    func updateData()
}

class DataManager {
    
    // MARK: - Static Properties
    
    static let shared = DataManager()
    
    // MARK: - Public Properties
    
    public var data: Array<Dictionary<String, Any>> = []
    
    public var delegate: DataManagerDelegate? = nil
    
    // MARK: - Public Methods
    
    public func requestData(url: String) {
        var jsonArray: Array<Dictionary<String, Any>> = []
        Alamofire.request(url).responseJSON { (responseObject) -> Void in
            jsonArray = self.convertToDictionary(response: responseObject)
            } .responseJSON(completionHandler: { _ in
                self.data = jsonArray
                self.delegate?.updateData()
            }
        )
    }
    
    public func remove(index: Int) {
        print("not implemented: remove(index: Int)")
    }
    
    // MARK: - Private Methods
    
    private func convertToDictionary(response: DataResponse<Any>) -> Array<Dictionary<String, Any>> {
        return response.result.value as! Array<Dictionary<String, Any>>
    }
    
}
