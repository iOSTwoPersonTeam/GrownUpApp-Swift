//
//  TDBaseRequestApI.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/15.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit
import Alamofire  // 网络请求第三方

/// 定义枚举类型
enum RequestType: Int {
    case GET
    case POST
}

class TDBaseRequestApI: NSObject {
    static let shareInstance: TDBaseRequestApI = {
        let requestAPI = TDBaseRequestApI()
        return requestAPI
    }()
}

// MARK: --封装请求方法
extension TDBaseRequestApI {
    // MARK: --请求JSON数据
     func requestData(methodType: RequestType, urlString: String, parameters: [String : AnyObject]?, finished:@escaping (_ result: AnyObject?, _ error: NSError?) -> ()) {
        
        // 1.定义请求结果回调闭包
        let resultCallBack = { (response: DataResponse<Any>) in
            if response.result.isSuccess {
                finished(response.result.value as AnyObject?, nil)
            } else {
                finished(nil, response.result.error as NSError?)
            }
        }
        // 2.请求数据
        let httpMethod: HTTPMethod = methodType == .GET ? .get : .post
        request(urlString, method: httpMethod, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: resultCallBack)
    }
}



