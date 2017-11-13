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
            
        self.adverScrollView.imageURLStringsGroup = ["http://fdfs.xmcdn.com/group31/M00/9E/32/wKgJSVl4WUzxtz8JAAJxYjP-AWU830_ios_large.jpg", "http://fdfs.xmcdn.com/group33/M0A/0D/B4/wKgJnVmWYdDCA4BEAAKCqs-DRzQ574_ios_large.jpg", "http://fdfs.xmcdn.com/group33/M0B/0D/EB/wKgJTFmWYhGAZ-r2AALtEuhyjq4607_ios_large.jpg"]
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










