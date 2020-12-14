//
//  ViewModelThePost.swift
//  ThePost
//
//  Created by Jordi Milla on 14/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import UIKit
import Moya

let provider = MoyaProvider<ThePostAPI>()

class ViewModelThePost {
    
    var refreshData = { () -> () in }
    var dataArray: [ThePost] = [] {
        didSet {
            refreshData()
        }
    }
    
    func retriveDataThePost() {
        
        provider.request(.getThePost) {result in
            switch result {
            case .success(let response):
                print("success")
                let array: [ThePost] = try! response.map(ResposableAPIArray.self).data
                self.dataArray = array
            case .failure:
                print("Error")
            }
        }
    }
}
