//
//  ViewController.swift
//  Task
//
//  Created by Taguhi Abgaryan on 2/14/17.
//  Copyright © 2017 Taguhi Abgaryan. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    fileprivate var tableView = UITableView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor.gray
    }
}

extension ViewController: DataManagerDelegate {
    
    func updateData() {
        setupTableView()
        self.tableView.reloadData()
        print(DataManager.shared.data)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataManager.shared.delegate = self
        setupTableView()
    }
    
    fileprivate func setupTableView() {
        tableView.frame = self.view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        self.view.addSubview(tableView)
    }
    
    // MARK: - Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let image = UIImage() // --> CHANGE
        let title = DataManager.shared.data[indexPath.row]["title"]
        let cell: TableViewCell = TableViewCell(image: image, title: title as! String)
        return cell
    }
    
    // MARK: - Table View Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> #\(indexPath.row)")
        let vc = DetailedViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
