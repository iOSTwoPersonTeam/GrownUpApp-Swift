//
//  HotAndGuessModel.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/15.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit
import ObjectMapper //字典Model转换类库

/// MARK: ---听北京
class CityRecModel: Mappable {
    
    var code: String?
    var title: String?
    var count: Int = 0
    var list: [GeneralRecommenModel]?
    var hasMore: Bool = false
    var contentType: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        title <- map["title"]
        count <- map["count"]
        list <- map["list"]
        hasMore <- map["hasMore"]
        contentType <- map["contentType"]
    }
}





/// MARK: ---猜你喜欢
class HotAndGuessModel: Mappable {
    
    var hasMore: Bool = false
    var title: String?
    var list: [GeneralRecommenModel]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        hasMore <- map["hasMore"]
        title <- map["title"]
        list <- map["list"]
    }
}
