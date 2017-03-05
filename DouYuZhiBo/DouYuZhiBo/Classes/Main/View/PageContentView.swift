//
//  PageContentView.swift
//  DouYuZhiBo
//
//  Created by 陈良静 on 2017/3/5.
//  Copyright © 2017年 陈良静. All rights reserved.
//

import UIKit

private let collectionViewCellId = "CellId"

class PageContentView: UIView {

    // MARK:- 定义属性
    fileprivate var childVcs: [UIViewController]
    fileprivate weak var parentsVc: UIViewController?
    
    // MARK:- 懒加载属性
    fileprivate lazy var collectionView: UICollectionView = {[weak self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = (self?.bounds.size)!
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        
        // 注册cell
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionViewCellId)
        
        return collectionView
    }()
    
    // MARK:- 自定义构造函数
    init(frame: CGRect, childVcs: [UIViewController], parentsVc: UIViewController?) {
        self.childVcs = childVcs
        self.parentsVc = parentsVc
        
        super.init(frame: frame)
        
        // 1.设置UI
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK:- 设置UI界面
extension PageContentView {
    fileprivate func setupUI() {
        // 1.把自控制器添加到父控制器上去
        for childVc in childVcs {
            parentsVc?.addChildViewController(childVc)
        }
        
        // 2.添加一个collectionView，用于在cell中存放自控制器的view
        addSubview(collectionView)
        collectionView.frame = bounds
    }
}

// MARK:- UICollectionViewDataSource
extension PageContentView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellId, for: indexPath)
        
        // 防止循环利用会将childVc.view重复添加
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        
        // 设置cell内容
        let childVc = childVcs[indexPath.item]
        childVc.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVc.view)
        
        return cell
    }
}
