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
    /*
       上方广告轮播图视图
     注意: 这里网络请求图片无法正常显示的原因是因为没有添加HTTPS的安全传输协议***
     */
    lazy var adverScrollView: SDCycleScrollView = {
        let adverView = SDCycleScrollView.init()
        adverView.backgroundColor = UIColor.white
        adverView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight
        self.addSubview(adverView)
        return adverView
    }()

    /// 下方分类轮播图视图
    lazy var categoryCollectionView: TDRecHeaderCategotyIconView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        layout.itemSize = CGSize.init(width: 60, height: 85)
        let cateCollectionView = TDRecHeaderCategotyIconView.init(frame: CGRect.init(x: 0, y: 160, width: SCREENWITH, height: 90), collectionViewLayout: layout)
        cateCollectionView.backgroundColor = UIColor.white
        self.addSubview(cateCollectionView)
        return cateCollectionView
    }()
    
    
    /// 上方轮播图数组
    var adverImagePics: [String]? {
        didSet{
//      self.adverScrollView.imageURLStringsGroup = ["http://fdfs.xmcdn.com/group31/M00/9E/32/wKgJSVl4WUzxtz8JAAJxYjP-AWU830_ios_large.jpg", "http://fdfs.xmcdn.com/group33/M0A/0D/B4/wKgJnVmWYdDCA4BEAAKCqs-DRzQ574_ios_large.jpg", "http://fdfs.xmcdn.com/group33/M0B/0D/EB/wKgJTFmWYhGAZ-r2AALtEuhyjq4607_ios_large.jpg"]
            
        self.adverScrollView.imageURLStringsGroup = adverImagePics
        self.adverScrollView.autoScroll = true
        self.updateConstraintsIfNeeded()
        self.setNeedsUpdateConstraints()
        }
        
      }
        /// 下方分类数组
    var adverCategoryModel: [CategoryListRecommendModel]! {
           didSet{
            self.categoryCollectionView.getdateWithModel(model: adverCategoryModel)
           self.categoryCollectionView.reloadData()
            
            self.updateConstraintsIfNeeded()
            self.setNeedsUpdateConstraints()
          }
    }
        

    
    // MARK:  添加布局frame
    override func updateConstraints() {
        super.updateConstraints()
        self.adverScrollView.frame = CGRect.init(x: 0, y: 0, width: SCREENWITH, height: SCREENHEIGHT/5)
        self.categoryCollectionView.frame = CGRect.init(x: 0, y: Int(SCREENHEIGHT/5), width: Int(SCREENWITH), height: 90)
    }
    
}









