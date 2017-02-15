//
//  Album.swift
//  Task
//
//  Created by Taguhi Abgaryan on 2/15/17.
//  Copyright © 2017 Taguhi Abgaryan. All rights reserved.
//

import Foundation

class Album {
    
    var thumbnailUrl = ""
    var url = ""
    var title = ""
    var id = 0
    var albumId = 0
    
    init(album: Dictionary<String, Any>) {
        thumbnailUrl = album["thumbnailUrl"] as? String ?? ""
        url = album["url"] as? String ?? ""
        title = album["title"] as? String ?? ""
        id = album["id"] as? Int ?? 0
        albumId = album["albumId"] as? Int ?? 0
    }
}

