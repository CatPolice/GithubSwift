//
//  APIManager.swift
//  GithubSwift
//
//  Created by runlin on 17/3/9.
//  Copyright © 2017年 gavin. All rights reserved.
//

import UIKit
import Alamofire


class APIManager: NSObject {
    
    let headers: HTTPHeaders = [
        "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
        "Accept": "application/json"
    ]
    
    
    func loadDdata(url:String , parameters:Parameters , callBack :@escaping () ->Void) -> Void {
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { response in
            
            //============
            callBack()
            
        }
        
    }
    
}
