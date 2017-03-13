//
//  UserRanking.swift
//  GithubSwift
//
//  Created by runlin on 17/3/7.
//  Copyright © 2017年 gavin. All rights reserved.
//

import UIKit

class UserRanking: BaseModel {
    
    var avatar_url : String!
    var events_url : String!
    var followers_url : String!
    var following_url : String!
    var gists_url : String!
    var gravatar_id : String!
    var html_url : String!
    var login : String!
    
    required init() {
    }
}


extension UserRanking{
    class func getUrlWithPar(_ url:String , success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()) ->Void{
        APIManager.rl_GET(url: url, success: { response in
            
            success(response)
            
        }) { (error) in
            print(error)
            failture(error)
        }
    }
}
