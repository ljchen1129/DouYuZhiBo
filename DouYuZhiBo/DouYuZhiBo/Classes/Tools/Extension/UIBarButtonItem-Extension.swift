//
//  UIBarButtonItem-Extension.swift
//  DouYuZhiBo
//
//  Created by 陈良静 on 2017/3/4.
//  Copyright © 2017年 陈良静. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    // 扩充一个类方法，不推荐使用
    /*
    class func craetItem(imageName: String, highImageName: String, size: CGSize) -> UIBarButtonItem {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: highImageName), for: .highlighted)
        btn.frame = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: size)
        
        return UIBarButtonItem(customView: btn)
    }
    */
    
    // 使用遍历构造函数，推荐使用
    // 扩充遍历构造函数：1、convenience关键字开头；2、构造函数中必须明确地调用一个指定构造函数(self)
    convenience init(imageName: String, highImageName: String = "", size: CGSize = CGSize(width: 0, height: 0)) {
        // 1.创建UIButton
        let btn = UIButton(type: .custom)
        // 2.设置btn的图片
        btn.setImage(UIImage(named: imageName), for: .normal)
        if highImageName != "" {
            btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        
        // 3.设置btn的尺寸
        if size == CGSize(width: 0, height: 0) {
            btn.sizeToFit()
        } else {
            btn.frame = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: size)
        }
        
        // 4.创建UIBarButtonItem
        self.init(customView: btn)
    }
}
