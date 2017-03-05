//
//  UIColor-Extension.swift
//  DouYuZhiBo
//
//  Created by 陈良静 on 2017/3/5.
//  Copyright © 2017年 陈良静. All rights reserved.
//

import UIKit

extension UIColor {
    
    // 扩展构造方法
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
    
}
