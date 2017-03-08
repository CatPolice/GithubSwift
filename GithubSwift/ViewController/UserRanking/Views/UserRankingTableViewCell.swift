//
//  UserRankingTableViewCell.swift
//  GithubSwift
//
//  Created by runlin on 17/3/8.
//  Copyright © 2017年 gavin. All rights reserved.
//

import UIKit

import AlamofireImage

class UserRankingTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gitUrl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configCellData(par:UserRanking) -> Void {
        self.gitUrl?.text = par.html_url
        self.name.text = par.login
        
        
        let urlStr = NSURL(string: par.avatar_url)
        self.avatarImg.af_setImage(withURL: urlStr as! URL)
        
//        DispatchQueue.global().async {
//            print("开始执行异步任务")
//            let urlStr = NSURL(string: par.avatar_url)
//            let data = NSData(contentsOf: urlStr! as URL)
//            let image = UIImage(data: data! as Data)
//            
//            Thread.sleep(forTimeInterval: 2)
//            print("异步任务执行完毕")
//            DispatchQueue.main.async {
//                print("回到UI线程")
//                self.avatarImg.image = image
//                
//            }
//        }
        
    }
    
    
}
