
//
//  TDSubHomeFactory.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/10.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit

enum TDSubHomeType {
    case TDSubHomeTypeRecommend     // 推荐
    case TDSubHomeTypeCategory      // 分类
    case TDSubHomeTypeRadio         //广播
    case TDSubHomeTypeRand          //榜单
    case TDSubHomeTypeAnchor        //主播
    case TDSubHomeTypeUnknow        //位置
}


class TDSubHomeFactory: NSObject {
  
    //MARK: --生成子控制器  class这里方便外部调用
  class func subHomeVCWith(identifier: String) -> TDBaseViewController {
        let subHomeType: TDSubHomeType = TDSubHomeFactory.typeFromTitle(title: identifier)
        var controller: TDBaseViewController!  // 定义一个变量
        switch subHomeType {
        case TDSubHomeType.TDSubHomeTypeRecommend:
            controller = TDRecommendViewController()
        case TDSubHomeType.TDSubHomeTypeCategory:
            controller = TDCategoryViewController()
        case TDSubHomeType.TDSubHomeTypeRadio:
            controller = TDRadioViewController()
        case TDSubHomeType.TDSubHomeTypeRand:
            controller = TDRankViewController()
        case TDSubHomeType.TDSubHomeTypeAnchor:
            controller = TDAnchorViewController()
        default:
            controller = TDBaseViewController()
        }
        return controller
    }
    
    
    //MARK: ---根据唯一标示查找对应类型
   private class func typeFromTitle(title: String) -> TDSubHomeType {
        if title == "推荐" {
            return TDSubHomeType.TDSubHomeTypeRecommend
        } else if title == "分类" {
            return TDSubHomeType.TDSubHomeTypeCategory
        } else if title == "广播" {
            return TDSubHomeType.TDSubHomeTypeRadio
        } else if title == "榜单" {
            return TDSubHomeType.TDSubHomeTypeRand
        } else if title == "直播" {
            return TDSubHomeType.TDSubHomeTypeAnchor
        } else {
            return TDSubHomeType.TDSubHomeTypeUnknow
        }
    }
    
    
    
}



