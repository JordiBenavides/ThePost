//
//  ViewModelOnePost.swift
//  ThePost
//
//  Created by Jordi Milla on 14/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import UIKit
import Moya

class ViewModelOnePost {
    
    let provider = MoyaProvider<ThePostAPI>()
    var id: Int?
    var refreshDataOnePost = { () -> () in}
    var dataOnePost: ThePost = ThePost(id: 19, title: "", body: "") {
        didSet {
            refreshDataOnePost()
        }
    }
    
    func requestPosById(id: Int) {
        provider.request(.getPostById(id: id)) { result in
            switch result {
            case .success(let response):
                print("success")
                let data: ThePost = try! response.map(ResponseAPI.self).data
                self.dataOnePost = data
            case .failure:
                print("Error")
            }
        }
    }
}
