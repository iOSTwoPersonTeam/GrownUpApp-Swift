//
//  TDRecommendViewController.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/10.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit

// MARK: --各个section
let tdHomeSectionEditCommen  = 0   // 小编推荐
let tdHomeSectionLive        = 1   // 现场直播
let tdHomeSectinGuess        = 2   // 猜你喜欢
let tdHomeSectionCityColumn  = 3   // 城市歌曲
let tdHomeSectionSpecial     = 4   // 精品单听
let tdHomeSectionAdvertise   = 5   // 推广
let tdHomeSectionHotCommends = 6   // 热门推荐
let tdHomeSectionMore        = 7   // 更多分类

// MARK: --tableView的cellID
let tdHomeSectionEditCommenID    = "tdHomeSectionEditCommenID"
let tdHomeSectionLiveID          = "tdHomeSectionLiveID"
let tdHomeSectinGuessID          = "tdHomeSectinGuessID"
let tdHomeSectionCityColumnID    = "tdHomeSectionCityColumnID"


class TDRecommendViewController: TDBaseViewController {

    // MARK:  --懒加载属性
    // 头部视图
    let headerFrame = CGRect.init(x: 0, y: 0, width: SCREENWITH, height: 250)
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
        return tableV
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange

        self.tableView.backgroundColor = UIColor.white
        
        self.headerView.adverImagePics = ["123"]
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
        return 4
    }
    
    // MARK: --cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            var cell = tableView.dequeueReusableCell(withIdentifier: tdHomeSectionEditCommenID)
            if cell == nil {
                cell = UITableViewCell.init(style: UITableViewCellStyle.subtitle, reuseIdentifier: tdHomeSectionEditCommenID)
            }
            cell?.backgroundColor = UIColor.yellow
            return cell!
        case 1:
            var cell = tableView.dequeueReusableCell(withIdentifier: tdHomeSectionLiveID)
            if cell == nil {
                cell = UITableViewCell.init(style: UITableViewCellStyle.subtitle, reuseIdentifier: tdHomeSectionLiveID)
            }
            cell?.backgroundColor = UIColor.purple
            return cell!
        case 2:
            var cell = tableView.dequeueReusableCell(withIdentifier: tdHomeSectinGuessID)
            if cell == nil {
                cell = UITableViewCell.init(style: UITableViewCellStyle.subtitle, reuseIdentifier: tdHomeSectinGuessID)
            }
            cell?.backgroundColor = UIColor.orange
            return cell!
        default:     // 其它
            return UITableViewCell()
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
    }
    
    
}













