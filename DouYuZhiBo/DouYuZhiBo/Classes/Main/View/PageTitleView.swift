//
//  PageTitleView.swift
//  DouYuZhiBo
//
//  Created by 陈良静 on 2017/3/4.
//  Copyright © 2017年 陈良静. All rights reserved.
//

import UIKit

fileprivate let kScrollLineH: CGFloat = 2

class PageTitleView: UIView {
    
    // MARK:- 定义属性
    fileprivate var titles: [String]
    
    // MARK: -懒加载属性
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        
        return scrollView
    }()
    
    fileprivate lazy var scrollLine: UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()
    
    fileprivate lazy var titleLabels = [UILabel]()
    
    // MARK:- 自定义构造函数
    init(frame: CGRect, titles: [String]) {
        self.titles = titles
        
        super.init(frame: frame)
        
        // 设置UI界面
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK:- 设置UI界面
extension PageTitleView {
    fileprivate func setupUI(){
        // 1.添加srcollView
        addSubview(scrollView)
        scrollView.frame = bounds
        
        // 2.添加titles对应的label
        setupTitleLabels()
        
        // 3.添加底线和滚动的滑块
        setupBottomLineAndScrollLine()
    }
    
    fileprivate func setupTitleLabels() {
        // 0.设置一些固定值
        let labelH = frame.size.height - kScrollLineH
        let labelW = frame.size.width / CGFloat(titles.count)
        
        for (index, title) in titles.enumerated() {
            // 1.创建label
            let label = UILabel()
            
            // 2.设置label属性
            label.text = title
            label.tag = index
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor.darkGray
            
            // 3.设置frame
            let labelX = CGFloat(index) * labelW
            label.frame = CGRect(x: labelX, y: 0, width: labelW, height: labelH)
            
            // 4.将label加到scrollView上
            scrollView.addSubview(label)
            titleLabels.append(label)
        }
    }
    
    fileprivate func setupBottomLineAndScrollLine() {
        
        // 1.底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        bottomLine.frame = CGRect(x: 0, y: frame.size.height - kScrollLineH, width: frame.size.width, height: kScrollLineH)
        addSubview(bottomLine)
        
        // 2.滚动滑块
        guard let firstLabel = titleLabels.first else { return }
        firstLabel.textColor = UIColor.orange
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)
        bringSubview(toFront: scrollView)
    }
}
