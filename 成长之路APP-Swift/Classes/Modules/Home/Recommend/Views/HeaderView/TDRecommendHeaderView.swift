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
        adverView.delegate = self
        adverView.placeholderImage = UIImage.init(named: "find_usercover")
        adverView.backgroundColor = UIColor.purple
        self.addSubview(adverView)
        return adverView
    }()
    
    /// 下方分类轮播图视图
    lazy var cateScorllView: UIView = {
        let cateView = UIView()
        self.addSubview(cateView)
        return cateView
    }()
    
    
    /// 上方轮播图数组Model
    var adverImagePics: [String]! {
        didSet{

        self.adverScrollView.imageURLStringsGroup = adverImagePics
        self.cateScorllView.backgroundColor  = UIColor.red

            self.updateConstraintsIfNeeded()
            self.setNeedsUpdateConstraints()
        }
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.adverScrollView.frame = CGRect.init(x: 0, y: 0, width: SCREENWITH, height: 160)
        self.cateScorllView.frame  = CGRect.init(x: 0, y: 165, width: SCREENWITH, height: 80)
    }
    
}

extension TDRecommendHeaderView: SDCycleScrollViewDelegate {
    
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        
    }
    
}










