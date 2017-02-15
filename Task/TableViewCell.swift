//
//  TableViewCell.swift
//  Task
//
//  Created by Taguhi Abgaryan on 2/15/17.
//  Copyright © 2017 Taguhi Abgaryan. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var iView: UIImageView = UIImageView()
    var title: String = ""
    
    init(image: UIImage, title: String) {
        self.title = title
        self.iView = UIImageView(image: image)
        super.init(style: .default, reuseIdentifier: cellReuseIdentifier)
        // update view
        
        self.textLabel?.text = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("No support for NSCoding")
    }
    
}
