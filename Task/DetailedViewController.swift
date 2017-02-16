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
    
    public var data = Album(album: [:])
    
    private var descriptionView = UIView()
    private var imageView = UIImageView(image: placeholderImage)
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateView()
    }
    
    // MARK: - Private Methods
    
    private func updateView() {
        // nav bar title
        self.navigationItem.title = "Detailed"
        // right bar button item
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Remove", style: .done, target: self, action: #selector(removeButtonAction(sender:)))
        // image view
        self.imageView.frame = CGRect(x: view.frame.minX, y: view.frame.minY, width: view.frame.width, height: view.frame.width)
        self.imageView.imageFromUrl(url: data.url)
        self.view.addSubview(imageView)
        // description view
        descriptionView.frame = CGRect(x: imageView.frame.minX, y: imageView.frame.maxY, width: view.frame.width, height: view.frame.height - imageView.frame.maxY)
        descriptionView.backgroundColor = descriptionViewBackgroundColor
        let padding = CGFloat(paddingPercent) * descriptionView.frame.width
        let labelWidth = CGFloat(labelWidthPercent) * descriptionView.frame.width
        // thumbnail
        let thumbnailWidth = descriptionView.frame.width - padding * 2 - labelWidth
        let thumbnailFrame = CGRect(x: padding, y: padding, width: thumbnailWidth, height: thumbnailWidth)
        let thumbnailImageView = UIImageView(frame: thumbnailFrame)
        thumbnailImageView.image = placeholderImage
        thumbnailImageView.imageFromUrl(url: data.thumbnailUrl)
        descriptionView.addSubview(thumbnailImageView)
        // label
        let label = UILabel(frame: CGRect(x: thumbnailFrame.maxX + padding, y: thumbnailFrame.minY, width: descriptionView.frame.width - 2 * padding - thumbnailFrame.maxX, height: descriptionView.frame.height - 2 * padding))
        label.backgroundColor = labelBackgroundColor
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = "@ \(data.title)\nAlbum: #\(data.albumId)\nImage: #\(data.id)"
        descriptionView.addSubview(label)
        self.view.addSubview(descriptionView)
    }
    
    @objc private func removeButtonAction(sender: UIBarButtonItem) {
        print("i didn't remove your item :P")
        self.navigationController?.popViewController(animated: true)
    }
}

