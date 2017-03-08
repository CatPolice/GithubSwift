//
//  UserRankingDetailedViewController.swift
//  GithubSwift
//
//  Created by runlin on 17/3/8.
//  Copyright © 2017年 gavin. All rights reserved.
//

import UIKit
import WebKit

class UserRankingDetailedViewController: UIViewController {
    
    var url:String! = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let wk:WKWebView = WKWebView(frame: CGRect(x:0, y:0, width:UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.height))
        self.view.addSubview(wk)
        let req = URLRequest.init(url: URL.init(string: url)!)
        wk.load(req)
        
//        print(self.url)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
