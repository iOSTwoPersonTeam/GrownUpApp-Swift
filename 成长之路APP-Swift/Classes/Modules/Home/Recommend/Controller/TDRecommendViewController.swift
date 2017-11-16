//
//  TDRecommendViewController.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/10.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit
import ObjectMapper  // 字典Model转换类库
import SwiftyJSON
import Alamofire

// MARK: --各个section
let tdRecommendSectionEditCommen  = 0   // 小编推荐
let tdRecommendSectionLive        = 1   // 现场直播
let tdRecommendSectionSpecial     = 2   // 精品单听
let tdRecommendSectionCityColumn  = 3   // 城市歌曲
let tdRecommendSectionHotCommends = 4   // 热门推荐

// MARK: --tableView的cellID
let tdRecommendSectionEditCommenID    = "tdHomeSectionEditCommenID"   //小编推荐
let tdRecommendSectionLiveID          = "tdHomeSectionLiveID"         //直播
let tdRecommendSectinSpecialID        = "tdRecommendSectinSpecialID"  //精品单听
let tdRecommendSectionCityColumnID    = "tdHomeSectionCityColumnID"   //听北京
let tdRecommendSectionHotCommendsID   = "tdRecommendSectionHotCommendsID"   // 热门推荐

class TDRecommendViewController: TDBaseViewController {

    // MARK:  --懒加载属性
    // 头部视图
    let headerFrame = CGRect.init(x: 0, y: 0, width: SCREENWITH, height: SCREENHEIGHT/5 + 90)
    lazy var headerView: TDRecommendHeaderView  = {
        let recHeaderView = TDRecommendHeaderView.init(frame: headerFrame)
        recHeaderView.backgroundColor = UIColor.orange
        return recHeaderView
    }()
    
    
    /// tableView
    lazy var tableView: UITableView = {
        let tableV = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: SCREENWITH, height: SCREENHEIGHT - 49 - 64 - 40), style: UITableViewStyle.plain)
        tableV.delegate = self
        tableV.dataSource = self
//        tableV.separatorStyle = UITableViewCellSeparatorStyle.none
        tableV.tableHeaderView  = UIView.init(frame: headerFrame)
        tableV.tableHeaderView?.addSubview(self.headerView)
        self.view.addSubview(tableV)
  
        // MARK: 这里必须采取注册cell的形式才能实现
         // section == 0
tableV.register(TDRecCellStyleCommonTableViewCell.classForCoder(), forCellReuseIdentifier: tdRecommendSectionEditCommenID)
        // section == 1
tableV.register(TDRecCellStyleLiveTableViewCell.classForCoder(), forCellReuseIdentifier: tdRecommendSectionLiveID)
        // section == 2
tableV.register(TDRecCellStyleSpecialTableViewCell.classForCoder(), forCellReuseIdentifier: tdRecommendSectinSpecialID)

        return tableV
    }()
    
    /// 懒加载 ViewModel
    lazy var viewModel: TDRecommendViewModel = {
    
        return TDRecommendViewModel()
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.headerView.adverImagePics = ["http://fdfs.xmcdn.com/group31/M00/9E/32/wKgJSVl4WUzxtz8JAAJxYjP-AWU830_ios_large.jpg", "http://fdfs.xmcdn.com/group33/M0A/0D/B4/wKgJnVmWYdDCA4BEAAKCqs-DRzQ574_ios_large.jpg", "http://fdfs.xmcdn.com/group33/M0B/0D/EB/wKgJTFmWYhGAZ-r2AALtEuhyjq4607_ios_large.jpg"]
        
        //---------------------------------------------
    TDBaseRequestApI.shareInstance.requestData(methodType: .GET, urlString: "http://mobile.ximalaya.com/mobile/discovery/v4/recommends?channel=ios-b1&device=iPhone&includeActivity=true&includeSpecial=true&scale=2&version=5.4.21", parameters: nil) { (result, error) in

        DLog(message: result!["editorRecommendAlbums"])

        let repos = Mapper<EditorRecommendModel>().map(JSON: result!["editorRecommendAlbums"] as! [String : Any])
        DLog(message: repos)
        
        }
       //----------------------------------------------------

        /// 加载数据
        self.viewModel.updateBlock = {
            
            // 更新列表数据
            self.tableView.reloadData()
        }
        self.viewModel.refreshDataSource()

    }

    
}

// MARK:  --TableView UITableViewDelegate & UITableViewDataSource代理方法和数据源方法
extension TDRecommendViewController: UITableViewDelegate, UITableViewDataSource {
   
    // MARK: --个section的row的值
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberSections()
    }
    
    // MARK: --各section的row的值
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberofItemInsection(section)
    }
    
    // MARK: --cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:    // 小编推荐
            let commenCell = tableView.dequeueReusableCell(withIdentifier: tdRecommendSectionEditCommenID, for: indexPath) as? TDRecCellStyleCommonTableViewCell
            commenCell?.backgroundColor = UIColor.yellow
            commenCell?.getDateWithModel(model: self.viewModel.editorRecModel)
            DLog(message: self.viewModel.editorRecModel)
            return commenCell!
        case 1:   // 现场直播
            let liveCell = tableView.dequeueReusableCell(withIdentifier: tdRecommendSectionLiveID, for: indexPath) as? TDRecCellStyleLiveTableViewCell
            liveCell?.backgroundColor = UIColor.purple
            liveCell?.getDateWithModel(model: self.viewModel.liveRecModel)
             DLog(message: self.viewModel.liveRecModel)
            return liveCell!
        case 2:   // 精品单曲
            let specialCell: TDRecCellStyleSpecialTableViewCell = tableView.dequeueReusableCell(withIdentifier: tdRecommendSectinSpecialID, for: indexPath) as! TDRecCellStyleSpecialTableViewCell
            specialCell.backgroundColor = UIColor.orange
            specialCell.getDateWithModel(model: self.viewModel.specailRecModel)
            DLog(message: self.viewModel.specailRecModel)
            return specialCell
        default:     // 其它
            return UITableViewCell()
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRow(at: indexPath)
    }
    
    
}













