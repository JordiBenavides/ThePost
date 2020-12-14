//
//  ThePost.swift
//  ThePost
//
//  Created by Jordi Milla on 14/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation

struct ResposableAPIArray: Codable {
   
    let data:[ThePost]
}

struct ThePost: Codable {
    
    let id: Int
    let title: String
    let body : String
}
