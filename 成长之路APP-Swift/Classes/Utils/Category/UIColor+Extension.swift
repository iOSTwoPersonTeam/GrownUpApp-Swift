//
//  UIColor+Extension.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/7.
//  Copyright © 2017年 hui. All rights reserved.
//

import Foundation
import UIKit


//颜色添加分类
extension UIColor {
    
   class func hexInt(_ hexValue: Int) -> UIColor {
        
        return UIColor.init(red: ((CGFloat)((hexValue & 0xFF0000) >> 16)) / 255.0,
            green: ((CGFloat)((hexValue & 0xFF00) >> 8)) / 255.0,
            blue: ((CGFloat)(hexValue & 0xFF)) / 255.0,
            alpha: 1.0)
    }
}















