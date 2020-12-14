//
//  ViewController.swift
//  ThePost
//
//  Created by Jordi Milla on 14/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import UIKit
import UIKit
import Moya

class ThePostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = ViewModelThePost()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setTable()
        bind()
    }
    
    private func configureView() {
        viewModel.retriveDataThePost()
    }
    
    private func bind() {
        viewModel.refreshData = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
    }
    
    func setTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ThePostTableViewCell", bundle: nil), forCellReuseIdentifier: "ThePostTableViewCell")
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThePostTableViewCell") as? ThePostTableViewCell
        let thePost = viewModel.dataArray[indexPath.row]
        cell?.configure(thePost: thePost)
        return cell ??  UITableViewCell()
    }

}

