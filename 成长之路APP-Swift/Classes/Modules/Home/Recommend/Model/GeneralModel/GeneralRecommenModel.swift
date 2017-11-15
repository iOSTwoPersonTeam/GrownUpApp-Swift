//
//  GeneralRecommenModel.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/15.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit
import ObjectMapper  // 字典Model转换类库


class GeneralRecommenModel: Mappable {
    
    var title: String?
    var tags: String?
    var serialState: Int = 0
    var nickname: String?
    var coverMiddle: String?
    var playsCounts: Int = 0
    var intro: String?
    var isPaid: Bool = false
    var commentsCount: Int = 0
    var albumId: Int = 0
    var ID: Int = 0
    var coverSmall: String?
    var coverLarge: String?
    var uid: Int = 0
    var tracks: Int = 0
    var trackTitle: String?
    var priceTypeId: Int = 0
    var isFinished: Int = 0
    var trackId: Int = 0
    var provider: String?
    var albumCoverUrl290: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        tags <- map["tags"]
        serialState <- map["serialState"]
        nickname <- map["nickname"]
        coverMiddle <- map["coverMiddle"]
        playsCounts <- map["playsCounts"]
        intro <- map["intro"]
        isPaid <- map["isPaid"]
        commentsCount <- map["commentsCount"]
        albumId <- map["albumId"]
        ID <- map["ID"]
        coverSmall <- map["coverSmall"]
        coverLarge <- map["coverLarge"]
        uid <- map["uid"]
        tracks <- map["tracks"]
        trackTitle <- map["trackTitle"]
        priceTypeId <- map["priceTypeId"]
        isFinished <- map["isFinished"]
        trackId <- map["trackId"]
        provider <- map["provider"]
        albumCoverUrl290 <- map["albumCoverUrl290"]
    }
    

}
