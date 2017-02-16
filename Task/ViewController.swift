//
//  ViewController.swift
//  Task
//
//  Created by Taguhi Abgaryan on 2/14/17.
//  Copyright © 2017 Taguhi Abgaryan. All rights reserved.
//

import UIKit

let placeholderImage = UIImage(named: "placeholder")

class ViewController: UIViewController {
    
    fileprivate var tableView = UITableView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barStyle = .default
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupTableView()
    }
}

extension ViewController: DataManagerDelegate {
    
    func updateData() {
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
            return
        })
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Albums"
        DataManager.shared.delegate = self
    }
    
    fileprivate func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = self.view.frame
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        self.view.addSubview(tableView)
    }
    
    // MARK: - Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let album = DataManager.shared.data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        cell.textLabel?.text = album.title
        cell.imageView?.image = placeholderImage
        cell.imageView?.imageFromUrl(url: album.url)
        return cell
    }
    
    // MARK: - Table View Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailedViewController()
        // pass data to detailed view controller
        vc.data = DataManager.shared.data[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
