//
//  TDRecommendRequest.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/15.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit

// MARK:  --首页推荐API
/// 小编推荐 --首页轮播图 --精品听单  三部分数据
fileprivate let kRecommendAPI = "http://mobile.ximalaya.com/mobile/discovery/v4/recommends?channel=ios-b1&device=iPhone&includeActivity=true&includeSpecial=true&scale=2&version=5.4.21"

/// 分类 --猜你喜欢 --听北京 ---热门推荐
fileprivate let kHotAndGuessAPI = "http://mobile.ximalaya.com/mobile/discovery/v2/recommend/hotAndGuess?code=43_110000_1100&device=iPhone&version=5.4.21"

/// 现场直播
fileprivate let kLiveRecommendAPI = "http://live.ximalaya.com/live-activity-web/v3/activity/recommend"




class TDRecommendRequest: NSObject {

    /// 小编推荐 --- 轮播图 -- 精品听单 三部分数据
   class func getRequestRecommends(_ finished:@escaping (_ result: AnyObject?, _ error: NSError?) -> ()) {
    
    TDBaseRequestApI.shareInstance.requestData(methodType: .GET, urlString: kRecommendAPI, parameters: nil) { (result, error) in
            finished(result, error)
        }
    }
    
    /// 分类 -猜你喜欢 -听北京--热门推荐
   class func getRequestHotAndGuess(_ finished:@escaping (_ result: AnyObject?, _ error: NSError?) -> ()) {
        TDBaseRequestApI.shareInstance.requestData(methodType: .GET, urlString: kHotAndGuessAPI, parameters: nil) { (result, error) in
            finished(result, error)
        }
    }
    
    /// 现场直播
   class func getRequestLiveRecommend(_ finished:@escaping (_ result: AnyObject?, _ error: NSError?) -> ()){
    
    TDBaseRequestApI.shareInstance.requestData(methodType: .GET, urlString: kLiveRecommendAPI, parameters: nil) { (result, error) in
            finished(result, error)
        }
        
    }
    
    
    
    
    
    
    
    
    
    
}




