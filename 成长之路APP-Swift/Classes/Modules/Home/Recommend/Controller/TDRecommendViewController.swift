//
//  TDRecommendViewController.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/10.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit

// MARK: --各个section
let tdRecommendSectionEditCommen  = 0   // 小编推荐
let tdRecommendSectionLive        = 1   // 现场直播
let tdRecommendSectinGuess        = 2   // 猜你喜欢
let tdRecommendSectionCityColumn  = 3   // 城市歌曲
let tdRecommendSectionSpecial     = 4   // 精品单听
let tdRecommendSectionAdvertise   = 5   // 推广
let tdRecommendSectionHotCommends = 6   // 热门推荐
let tdRecommendSectionMore        = 7   // 更多分类

// MARK: --tableView的cellID
let tdRecommendSectionEditCommenID    = "tdHomeSectionEditCommenID"
let tdRecommendSectionLiveID          = "tdHomeSectionLiveID"
let tdRecommendSectinGuessID          = "tdHomeSectinGuessID"
let tdRecommendSectionCityColumnID    = "tdHomeSectionCityColumnID"


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
tableV.register(TDRecCellStyleSpecialTableViewCell.classForCoder(), forCellReuseIdentifier: tdRecommendSectinGuessID)
        
        return tableV
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange

        self.tableView.backgroundColor = UIColor.white
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.tableView.reloadData()
        self.headerView.adverImagePics = ["http://fdfs.xmcdn.com/group31/M00/9E/32/wKgJSVl4WUzxtz8JAAJxYjP-AWU830_ios_large.jpg", "http://fdfs.xmcdn.com/group33/M0A/0D/B4/wKgJnVmWYdDCA4BEAAKCqs-DRzQ574_ios_large.jpg", "http://fdfs.xmcdn.com/group33/M0B/0D/EB/wKgJTFmWYhGAZ-r2AALtEuhyjq4607_ios_large.jpg"]
    }
    
}

// MARK:  --TableView UITableViewDelegate & UITableViewDataSource代理方法和数据源方法
extension TDRecommendViewController: UITableViewDelegate, UITableViewDataSource {
   
    // MARK: --个section的row的值
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    // MARK: --各section的row的值
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // MARK: --cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let commenCell: TDRecCellStyleCommonTableViewCell = tableView.dequeueReusableCell(withIdentifier: tdRecommendSectionEditCommenID, for: indexPath) as! TDRecCellStyleCommonTableViewCell
            commenCell.backgroundColor = UIColor.yellow
            commenCell.getDateWithModel(model: "123")
            return commenCell
        case 1:
            let liveCell: TDRecCellStyleLiveTableViewCell = tableView.dequeueReusableCell(withIdentifier: tdRecommendSectionLiveID, for: indexPath) as! TDRecCellStyleLiveTableViewCell
            liveCell.backgroundColor = UIColor.purple
            liveCell.getDateWithModel(model: "123")
            return liveCell
        case 2:
            let specialCell: TDRecCellStyleSpecialTableViewCell = tableView.dequeueReusableCell(withIdentifier: tdRecommendSectinGuessID, for: indexPath) as! TDRecCellStyleSpecialTableViewCell
            specialCell.backgroundColor = UIColor.orange
            return specialCell
        default:     // 其它
            return UITableViewCell()
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 2 {
            return 240
        }
        return 200;
    }
    
    
}













