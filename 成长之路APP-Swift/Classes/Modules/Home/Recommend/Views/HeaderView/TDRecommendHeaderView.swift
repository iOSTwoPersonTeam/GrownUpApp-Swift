//
//  TDRecommendHeaderView.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/13.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit
import SDCycleScrollView

class TDRecommendHeaderView: UIView {

    // MARK:  ---懒加载属性
    /// 上方广告轮播图视图
    lazy var adverScrollView: SDCycleScrollView = {
        let adverView = SDCycleScrollView()
        adverView.placeholderImage = UIImage.init(named: "find_usercover")
        adverView.backgroundColor = UIColor.purple
        self.addSubview(adverView)
        return adverView
    }()

    /// 上方轮播图数组Model
    var adverImagePics: [String]! {
        didSet{
        self.adverScrollView.imageURLStringsGroup = adverImagePics
        self.updateConstraintsIfNeeded()
        self.setNeedsUpdateConstraints()
        }
    }
    
    // MARK:  添加布局frame
    override func updateConstraints() {
        super.updateConstraints()
        self.adverScrollView.frame = CGRect.init(x: 0, y: 0, width: SCREENWITH, height: 160)
    }
    
}









