//
//  MainViewController.swift
//  DouYuZhiBo
//
//  Created by 陈良静 on 2017/3/4.
//  Copyright © 2017年 陈良静. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildVC(storyboardName: "Home")
        addChildVC(storyboardName: "Live")
        addChildVC(storyboardName: "Follow")
        addChildVC(storyboardName: "Profile")
        
    }
    
    private func addChildVC(storyboardName: String)
    {
        // 1.通过storyboard创建控制器
        let childVC = UIStoryboard(name: storyboardName, bundle: nil).instantiateInitialViewController()!
        // 2.将childVC作为子控制器
        addChildViewController(childVC)
    }

}
