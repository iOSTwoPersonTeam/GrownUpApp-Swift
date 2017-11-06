//
//  Common.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/6.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit

//当前系统版本
let TDSystemVersion = (UIDevice.current.systemVersion as NSString).floatValue
//屏幕高度
let TDScreenHeight = UIScreen.main.bounds.height
//屏幕宽度
let TDScreenWith = UIScreen.main.bounds.width

//MARK: -颜色方法
func RGBA(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}











