//
//  TDRecommendViewModel.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/15.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit
import ObjectMapper  // 字典Model转换类库
import SwiftyJSON

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
     var liveRecModel: Array<LiveRecommendModel?> = []
    /// 猜你喜欢
    var horAndGuessRecModel: HotAndGuessModel!
    /// 听北京
    var cityRecModel: CityRecModel!
    
    
    // MARK: --对数据处理的属性
    /// 轮播图URL数组
    var focusImgsPics: [String] = [String]()
    /// 分类列表
    var categoryListRecModel: [CategoryListRecommendModel] = [CategoryListRecommendModel]()

    
    // MARK:- 数据更新回调
    typealias AddBlock = () -> Void
    var updateBlock: AddBlock?
}


// MARK: --加载数据
extension TDRecommendViewModel {

    func refreshDataSource() {
      // 加载 小编推荐 --轮播图 --精品听单 获取数据
        TDRecommendRequest.getRequestRecommends { (result, error) in
            if error != nil {
                DLog(message: error)
            } else {
                
                DLog(message: result!["editorRecommendAlbums"])
                /// 小编推荐
                let editorRecModel = Mapper<EditorRecommendModel>().map(JSON: result!["editorRecommendAlbums"] as! [String : Any])
                DLog(message: editorRecModel)
                /// 轮播图
                let foucusImgsModel = Mapper<FocusImagesRecommendModel>().map(JSON: result!["focusImages"] as! [String : Any])
                DLog(message: foucusImgsModel)
                /// 精品听单
                let specialRecModel = Mapper<SpecialRecommendModel>().map(JSON: result!["specialColumn"] as! [String : Any])
                DLog(message: specialRecModel)

                self.editorRecModel = editorRecModel
                self.foucusImagsModel = foucusImgsModel
                self.specailRecModel = specialRecModel
                
                /*
                   处理数据
                 */
                /// 遍历取出轮播图
                if let focusImgsList = foucusImgsModel?.list {
                    for item in focusImgsList {
                        self.focusImgsPics.append(item.pic ?? "")
                    }
                }
                
                // 更新tableView数据
                self.updateBlock!()
            }
        }
    
        // 加载数据  分类 猜你喜欢  热门推荐
        TDRecommendRequest.getRequestHotAndGuess { (result, error) in
            if error != nil {
                DLog(message: error)
            } else {
                /// 分类
                let categoryRecModel = Mapper<CategoryRecommendModel>().map(JSON: result!["discoveryColumns"] as! [String : Any])
                DLog(message: categoryRecModel)
                
                /// 猜你喜欢
                let hotAndGuessRecModel = Mapper<HotAndGuessModel>().map(JSON: result!["guess"] as! [String : Any])
                DLog(message: hotAndGuessRecModel)
                
                /// 听北京
                let cityRecModel = Mapper<CityRecModel>().map(JSON: result!["cityColumn"] as! [String : Any])
                DLog(message: cityRecModel)
                
               self.categoryRecModel = categoryRecModel
               self.horAndGuessRecModel = hotAndGuessRecModel
               self.cityRecModel = cityRecModel
                
                /*
                   处理数据
                 */
                /// 分类
                if let categoryListRecModel = categoryRecModel?.list{
                    self.categoryListRecModel = categoryListRecModel
                }
                
                // 刷新数据
                self.updateBlock!()
            }
        }
        
        
        // 加载数据  现场直播
        TDRecommendRequest.getRequestLiveRecommend { (result, error) in
            if error != nil {
                DLog(message: error)
            } else {
                let liveRecModel = Mapper<LiveRecommendModel>().mapArray(JSONObject: result!["data"]!)
                DLog(message: liveRecModel)

                self.liveRecModel = liveRecModel!

                ///  更新tableView数据
                self.updateBlock!()
            }
        }

    }
    
}


// MARK: --各个section的高度
let kSectionHeight: CGFloat         = 230.0
let kSectionLiveHeight: CGFloat     = 227.0
let kSectionSpecialHeight: CGFloat  = 219.0


// MARK: --tableView的数据
extension TDRecommendViewModel {
    
    func numberSections() -> NSInteger {
        return 3
    }
    
    func numberofItemInsection(_ section: NSInteger) -> NSInteger {
        /// 各值定义在控制器下
        switch section {
        case tdRecommendSectionEditCommen:  // 小编推荐
            return 1
        case tdRecommendSectionLive:       // 现场直播
            return 1
        case tdRecommendSectionSpecial:    // 精品单曲
            return 1
        default:
            return 0
        }
    }
    
    func heightForRow(at indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case tdRecommendSectionEditCommen:  // 小编推荐
            return kSectionHeight
        case tdRecommendSectionLive:  // 现场直播
            return kSectionLiveHeight
        case tdRecommendSectionSpecial:  // 精品单曲
            return kSectionSpecialHeight
        default:
            return 0
        }
    }
    
    
    
}


























