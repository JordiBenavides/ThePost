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
}

extension ThePostAPI:TargetType,AccessTokenAuthorizable {
    public var baseURL: URL { return URL(string: "https://gorest.co.in/public-api")!}
    
    public var path: String{
        switch self {
        case .getThePost:
            return "posts"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getThePost:
            return .get
        }
    }
    
    var authorizationType: AuthorizationType {
        switch self {
        case .getThePost:
            return .bearer
        }
    }
    
    public var task: Task {
        switch self {
        case .getThePost:
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
