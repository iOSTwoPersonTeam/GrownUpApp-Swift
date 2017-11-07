//
//  UIView+Extension.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/7.
//  Copyright © 2017年 hui. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    //裁剪view的圆角
    func clipRectCorner(direction: UIRectCorner, cornerRadius: CGFloat)  {
        let cornerSize = CGSize.init(width: cornerRadius, height: cornerRadius)
        let maskPath = UIBezierPath.init(roundedRect: bounds, byRoundingCorners: direction, cornerRadii: cornerSize)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.addSublayer(maskLayer)
        layer.mask = maskLayer
    }
    
    //坐标定义
    //x
    public var x: CGFloat {
        get{
            return self.frame.origin.x
        }
        set{
            var r = self.frame
            r.origin.x = newValue
            self.frame = r
        }
    }
    //y
    public var y: CGFloat {
        get{
            return self.frame.origin.y
        }
        set{
            var r = self.frame
            r.origin.y = newValue
            self.frame = r
        }
    }
    //with
    public var width: CGFloat{
        get{
            return self.frame.size.width
        }
        set{
            var r = self.frame
            r.size.width = newValue
            self.frame  = r
        }
    }
    
    //height
    public var height: CGFloat{
        get{
            return self.frame.size.height
        }
        set{
            var r = self.frame
            r.size.height = newValue
            self.frame = r
        }
    }
    
    public var origin: CGPoint {
        get{
            return self.frame.origin
        }
        set{
            self.x = newValue.x
            self.y = newValue.y
        }
    }
    
    public var size: CGSize{
        get{
            return self.frame.size
        }
        set{
            self.width = newValue.width
            self.height = newValue.height
        }
    }
    
    //右边界的x值
    public var rightX: CGFloat {
        get{
            return self.x + self.width
        }
        set{
            var r = self.frame
            r.origin.x = newValue - frame.size.width
            self.frame = r
        }
    }
    
    //下边界的y值
    public var bottomY: CGFloat {
        get{
            return self.y + self.height
        }
        set{
            var r = self.frame
            r.origin.y = newValue  - frame.size.height
            self.frame = r
        }
    }

    
}






















