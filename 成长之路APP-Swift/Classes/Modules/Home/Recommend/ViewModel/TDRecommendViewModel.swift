//
//  TDRecommendViewModel.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/15.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit
import ObjectMapper  // 字典Model转换类库

class TDRecommendViewModel: NSObject {

    // MARK: --网络请求Model属性
    /// 轮播图
    var foucusImagsModel: FocusImagesRecommendModel!
    /// 分类
    var categoryRecModel: CategoryRecommendModel!
    /// 小编推荐
     var editorRecModel: EditorRecommendModel!
    /// 精品单曲
    var specailRecModel: SpecialRecommendModel!
    /// 现场直播
     var liveRecModel: LiveRecommendModel!
    /// 猜你喜欢
    
    /// 热门推荐
    
    
    
    // MARK: --对数据处理的属性
    /// 轮播图URL数组
    var focusImgsPics: [String] = [String]()
    /// 分类
    var headerCategorys: [CategoryListRecommendModel] = [CategoryListRecommendModel]()
    
    // MARK:- 数据更新回调

}


// MARK: --加载数据
extension TDRecommendViewModel {

 
    
}

















