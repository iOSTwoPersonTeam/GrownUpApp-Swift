//
//  NSString+Extenstion.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/7.
//  Copyright © 2017年 hui. All rights reserved.
//

import Foundation
import UIKit

extension String {
    // MARK:- 获取字符串的CGSize
    func getSize(with fontSize: CGFloat) -> CGSize {
        let str = self as NSString
        
        let size = CGSize(width: UIScreen.main.bounds.width, height: CGFloat(MAXFLOAT))
        return str.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize)], context: nil).size
    }
}


















