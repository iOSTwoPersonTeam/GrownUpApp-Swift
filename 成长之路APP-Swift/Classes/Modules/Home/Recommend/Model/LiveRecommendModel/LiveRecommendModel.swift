//
//  LiveRecommendModel.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/15.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit
import ObjectMapper  // 字典Model转换类库

class LiveRecommendModel: Mappable {

    var ID: Int = 0
    var onlineCount: Int = 0
    var endTs: Int = 0
    var remainMs: Int = 0
    var playCount: Int = 0
    var shortDescription: String?
    var startTs: Int = 0
    var scheduleId: Int = 0
    var chatId: Int = 0
    var coverPath: String?
    var name: String?
    var status: Int = 0
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        ID <- map["ID"]
        onlineCount <- map["onlineCount"]
        endTs <- map["endTs"]
        remainMs <- map["remainMs"]
        playCount <- map["playCount"]
        shortDescription <- map["shortDescription"]
        startTs <- map["startTs"]
        scheduleId <- map["scheduleId"]
        chatId <- map["chatId"]
        coverPath <- map["coverPath"]
        name <- map["name"]
        status <- map["status"]
    }
}
