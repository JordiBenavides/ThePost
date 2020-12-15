//
//  ThePostAPI.swift
//  ThePost
//
//  Created by Jordi Milla on 14/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import Moya

enum ThePostAPI {
    
    case getThePost
    case getPostById(id: Int)
}

extension ThePostAPI:TargetType,AccessTokenAuthorizable {
    public var baseURL: URL { return URL(string: "https://gorest.co.in/public-api")!}
    
    public var path: String{
        switch self {
        case .getThePost:
            return "posts"
        case .getPostById(id: let id):
            return "posts/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getThePost:
            return .get
        case .getPostById(id: _):
            return .get
        }
    }
    
    var authorizationType: AuthorizationType {
        switch self {
        case .getThePost:
            return .bearer
        case .getPostById(id: _):
            return .bearer
        }
    }
    
    public var task: Task {
        switch self {
        case .getThePost:
            return .requestPlain
        case .getPostById(id: _):
            return .requestPlain
        }
    }
    
    public var validationType: ValidationType {
        return .none
    }
    
    public var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    public var headers: [String : String]? {
        return nil
    }
}
