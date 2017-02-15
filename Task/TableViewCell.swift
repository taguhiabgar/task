//
//  TableViewCell.swift
//  Task
//
//  Created by Taguhi Abgaryan on 2/15/17.
//  Copyright © 2017 Taguhi Abgaryan. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var album: Album
    
    init(album: Album) {
        self.album = album
        super.init(style: .default, reuseIdentifier: cellReuseIdentifier)
        // update view
        self.textLabel?.text = album.title
        self.imageView?.imageFromUrl(url: album.thumbnailUrl)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("No support for NSCoding")
    }
}

