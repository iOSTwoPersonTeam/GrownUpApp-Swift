//
//  EditorRecommendModel.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/15.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit
import ObjectMapper  // 字典Model转换类库

// MARK: --轮播图部分
class FocusImagesRecommendModel: Mappable {
    
    var ret: Int = 0
    var title: String?
    var list: [FocusImagesDetailRecommendModel]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        ret <- map["ret"]
        title <- map["title"]
        list <- map["list"]
    }
}

// MARK: --轮播图详情部分
class FocusImagesDetailRecommendModel: Mappable {
    
    var uid: Int = 0
    var shortTitle: String?
    var ID: Int = 0
    var pic: String?
    var albumId: Int = 0
    var isShare: Bool = false
    var is_External_url: Bool = false
    var type: Int = 0
    var longTitle: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        
        uid <- map["uid"]
        shortTitle <- map["shortTitle"]
        ID <- map["ID"]
        pic <- map["pic"]
        albumId <- map["albumId"]
        isShare <- map["isShare"]
        is_External_url <- map["is_External_url"]
        type <- map["type"]
        longTitle <- map["longTitle"]
    }
}


// MARK --小编推荐部分
class EditorRecommendModel: Mappable {
    
    var title: String?
    var list: [GeneralRecommenModel]?
    var hasMore: Bool = false
    var ret: Int = 0
    
    required init?(map: Map) {
    }

    func mapping(map: Map) {
        
        title <- map["title"]
        list <- map["list"]
        hasMore <- map["hasMore"]
        ret <- map["ret"]
    }
}


// MARK: --特殊类型cell,精品单曲
class SpecialRecommendModel: Mappable {
    
    var title: String?
    var list: [SpecialDetailRecommendModel]?
    var hasMore: Bool = false
    var ret: Int = 0
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        
        title <- map["title"]
        list <- map["list"]
        hasMore <- map["hasMore"]
        ret <- map["ret"]
    }
}


// MARK: --特殊类型cell,精品单曲详情
class SpecialDetailRecommendModel: Mappable {
    
    var specialId: Int = 0
    var subtitle: String?
    var coverPath: String?
    var contentType: String?
    var title: String?
    var footnote: String?
    var columnType: Int = 0
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        
        specialId <- map["specialId"]
        subtitle <- map["subtitle"]
        coverPath <- map["coverPath"]
        contentType <- map["contentType"]
        title <- map["title"]
        footnote <- map["footnote"]
        columnType <- map["columnType"]
    }
}










