//
//  MainViewController.swift
//  GithubSwift
//
//  Created by runlin on 17/3/7.
//  Copyright © 2017年 gavin. All rights reserved.
//

import UIKit



class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func userRankingAction(_ sender: Any) {
        self.navigationController?.pushViewController(UserRankingViewController(), animated: true)
    }

    
}
