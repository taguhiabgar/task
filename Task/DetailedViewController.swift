//
//  DetailedViewController.swift
//  Task
//
//  Created by Taguhi Abgaryan on 2/15/17.
//  Copyright © 2017 Taguhi Abgaryan. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    // MARK: - Properties
    
    public var data: Dictionary<String, Any> = [:]
    
    private var removeButton = UIButton()
    private var titleLabel = UILabel()
    private var imageView = UIImageView()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
    }
    
    private func updateView() {
        // update label, button, imageView!!!
    }
    
}

class Json {
    
    
    
}

/*
 "albumId": 1,
 "id": 2,
 "title": "reprehenderit est deserunt velit ipsam",
 "url": "http://placehold.it/600/771796",
 "thumbnailUrl": "http://placehold.it/150/dff9f6"
 */
