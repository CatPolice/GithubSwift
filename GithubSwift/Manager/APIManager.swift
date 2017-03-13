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
    
    
    func loadDdatasss(url:String , parameters:Parameters , success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()) -> Void {
        
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { response in
            switch response.result{
            case .success:
                if let value = response.result.value as? [String : AnyObject]{
                    success(value)
                    print(value)
                }
                break;
            
            case .failure(let error):
                failture(error)
                print(error)
                break;
            }
        }
        
    }
    
    
    class func rl_GET(url:String , success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()) -> Void{
        
        
        Alamofire.request(url, method: .get, encoding: URLEncoding.default).responseJSON { response in
            
            switch response.result{
            case .success:
                if let value = response.result.value as? [String : AnyObject]{
                    success(value)
                    print(value)
                }
                break
            case .failure(let error):
                failture(error)
                print(error)
                break
            }
        }
    }
    
}
