//
//  CategoryRecommendModel.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/15.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit
import ObjectMapper  // 字典Model转换类库

class CategoryRecommendModel: Mappable {

    var ret: Int = 0
    var title: String?
    var list: [CategoryListRecommendModel]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        ret <- map["ret"]
        title <- map["title"]
        list <- map["list"]
    }
}

class CategoryListRecommendModel: Mappable {
    
    var subtitle: String?
    var coverPath: String?
    var contentType: String?
    var title: String?
    var enableShare: Bool = false
    var isExternalUrl: Bool = false
    var properties: CategoryPropertiesRecommendModel?
    var sharePic: String?
    var url: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        subtitle <- map["subtitle"]
        coverPath <- map["coverPath"]
        contentType <- map["contentType"]
        title <- map["title"]
        enableShare <- map["enableShare"]
        isExternalUrl <- map["isExternalUrl"]
        properties <- map["properties"]
        sharePic <- map["sharePic"]
        url <- map["url"]
    }
}


class CategoryPropertiesRecommendModel: Mappable {
    
    var key: String?
    var contentType: String?
    var rankingListId: Int = 0
    var isPaid: Bool = false
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        key <- map["key"]
        contentType <- map["contentType"]
        rankingListId <- map["rankingListId"]
        isPaid <- map["isPaid"]
    }
}









