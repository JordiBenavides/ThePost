//
//  OnePostViewController.swift
//  ThePost
//
//  Created by Jordi Milla on 14/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import UIKit

class OnePostViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var id: Int?
    var viewModelOnePost = ViewModelOnePost()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        bind()
    }
    
    private func configureView() {
        guard let id = self.id else { return }
        viewModelOnePost.requestPosById(id: id)
        
    }
    
    private func bind() {
        viewModelOnePost.refreshDataOnePost = { [weak self] () in
            DispatchQueue.main.async {
                self?.updateLabels()
            }
        }
        
    }
    
    func updateLabels() {
        titleLabel.text = viewModelOnePost.dataOnePost.title
        bodyLabel.text = viewModelOnePost.dataOnePost.body
        
    }
}
