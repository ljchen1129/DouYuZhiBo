//
//  HomeViewController.swift
//  DouYuZhiBo
//
//  Created by 陈良静 on 2017/3/4.
//  Copyright © 2017年 陈良静. All rights reserved.
//

import UIKit

fileprivate let kTitleViewH: CGFloat = 40

class HomeViewController: UIViewController {
    
    // MARK:- 懒加载属性
    fileprivate lazy var pageTitleView: PageTitleView = {
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        
        return titleView
    }()
    
    fileprivate lazy var pageContentView: PageContentView = { [weak self] in
        // 1.确定frame
        let contentViewY = kStatusBarH + kTitleViewH + kNavigationBarH
        let contentViewW = kScreenW
        let contentViewH = kSreenH - contentViewY
        
        // 2.添加子控制器
        var childVcs = [UIViewController]()
        for _ in 0..<4 {
            let childVc = UIViewController()
            childVc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255))/255.0, g: CGFloat(arc4random_uniform(255))/255.0, b: CGFloat(arc4random_uniform(255))/255.0)
            childVcs.append(childVc)
        }
        
        let frame = CGRect(x: 0, y: contentViewY, width: contentViewW, height: contentViewH)
        let contentView = PageContentView(frame: frame, childVcs: childVcs, parentsVc: self)
        return contentView
    }()
    
    // MARK:- 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置UI界面
        setupUI()
    }

}

// MARK:- 设置UI界面
extension HomeViewController {
    fileprivate func setupUI() {
        // 1.不要调整UIScrollView的内边距，不然系统会自动将scrollView的y坐标加64
        automaticallyAdjustsScrollViewInsets = false
        
        // 2.设置导航栏
        setupNavigationBar()
        
        // 3.添加titleView
        view.addSubview(pageTitleView)
        
        // 4.添加contentView
        view.addSubview(pageContentView)
    }
    
    fileprivate func setupNavigationBar() {
        // 1.设置左侧的item
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo", highImageName: "", size: CGSize(width: 0, height: 0))
        
        // 2.设置右侧的item
        let size = CGSize(width: 40, height: 40);

        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
    }
}
