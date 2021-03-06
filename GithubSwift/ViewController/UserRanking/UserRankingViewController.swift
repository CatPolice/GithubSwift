//
//  UserRankingViewController.swift
//  GithubSwift
//
//  Created by runlin on 17/3/7.
//  Copyright © 2017年 gavin. All rights reserved.
//

import UIKit
import Alamofire


class UserRankingViewController: UIViewController{

    
    @IBOutlet weak var userRankingTableview: UITableView!
    var userRankingList : NSMutableArray = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    self.userRankingTableview.register(UINib(nibName:"UserRankingTableViewCell",bundle:nil),forCellReuseIdentifier:"UserRankingTableViewCell")
        self.userRankingTableview.rowHeight = 80
        
        
        
        UserRanking.getUrlWithPar("https://api.github.com/search/users?q=language:objective-c&sort=followers&order=desc", success: { response in
            //把得到的JSON数据转为数组
            if let items:NSDictionary = response as NSDictionary?{
                let user_list:NSArray = items.object(forKey: "items") as! NSArray
                //遍历数组得到每一个字典模型
                for user in user_list{
                    if let object = UserRanking.deserialize(from: user as? NSDictionary) {
                        print(object)
                        self.userRankingList.add(object)
                    }
                }
                self.userRankingTableview.reloadData()
            }
     
            
        }) { (error) in
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}




extension UserRankingViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserRankingTableViewCell")as?UserRankingTableViewCell
        let obj:UserRanking = self.userRankingList[indexPath.row] as! UserRanking
        cell?.configCellData(par: obj)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userRankingList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let obj:UserRanking = self.userRankingList[indexPath.row] as! UserRanking
        let vc = UserRankingDetailedViewController()
        vc.url = obj.html_url
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


