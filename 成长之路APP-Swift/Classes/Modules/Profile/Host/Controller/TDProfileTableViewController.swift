//
//  TDProfileTableViewController.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/6.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit

//MARK: -列表标题
let kMeSubScribe = "我的订阅"
let kMePlayHistory = "播放历史"

let kMeHasBuy = "我的已购"
let kMeWallet = "我的钱包"

let kMeLXFStore = "喜马拉雅商城"
let kMeStoreOrder = "我的商城订单"
let kMeCoupon = "我的优惠券"
let kMeGameenter = "游戏中心"
let kMeSnartDevice = "智能硬件设备"

let kMeFreeTrafic = "免流量服务"
let kMeFeedBack = "意见反馈"
let kMeSetting = "设置"

//MARK: -列表对应图片
let kMeSubScribeIcon = "me_setting_favAlbum"
let kMePlayHistoryIcon = "me_setting_playhis"

let kMeHasBuyIcon = "me_setting_boughttracks"
let kMeWalletIcon = "me_setting_account"

let kMeLXFStoreIcon = "me_setting_store"
let kMeStoreOrderIcon = "me_setting_myorder"
let kMeCouponIcon = "me_setting_coupon"
let kMeGameenterIcon = "me_setting_game"
let kMeSnartDeviceIcon = "me_setting_device"

let kMeFreeTraficIcon = "me_setting_union"
let kMeFeedBackIcon = "me_setting_feedback"
let kMeSettingIcon = "me_setting_setting"

//免流量服务 链接
let kFreeTraficURL = "http://hybrid.ximalaya.com/api/telecom/index?app=iting&device=iPhone&impl=com.gemd.iting&telephone=%28null%29&version=5.4.27"

let headerViewH: CGFloat = 288


class TDProfileTableViewController: TDBaseViewController {

    //MARK:-懒加载属性
    //tableView
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: SCREENWITH, height: SCREENHEIGHT - 49), style: UITableViewStyle.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.hexInt(0xf3f3f3)
        return tableView
    }()
    
    //列表标题数组
    lazy var titleArray: [[String]] = {
        
        return [[kMeSubScribe, kMePlayHistory],
                [kMeHasBuy, kMeWallet],
                [kMeLXFStore, kMeStoreOrder, kMeCoupon, kMeGameenter, kMeSnartDevice],
                [kMeFreeTrafic, kMeFeedBack, kMeSetting]]
    }()
    
    //列表图标数组
    lazy var imageArray: [[String]] = {
        
        return [[kMeSubScribeIcon, kMePlayHistoryIcon],
                [kMeHasBuyIcon, kMeWalletIcon],
                [kMeLXFStoreIcon, kMeStoreOrderIcon, kMeCouponIcon, kMeGameenterIcon, kMeSnartDeviceIcon],
                [kMeFreeTraficIcon, kMeFeedBackIcon, kMeSettingIcon]]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hexInt(0xf3f3f3)
        automaticallyAdjustsScrollViewInsets = false
        //添加tableView
         self.view.addSubview(tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    

}



//MARK: -tableView 代理 & 数据源
extension TDProfileTableViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: 数据源
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.titleArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titleArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let subTextArr = titleArray[indexPath.section]
        let imgArr = imageArray[indexPath.section]
        
        //cell 重用
        let cellID = "cellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellID)
        }
        //文字
        cell?.textLabel?.text = subTextArr[indexPath.row]
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 15)
        cell?.textLabel?.textColor = RGBA(r: 0.0, g: 0.0, b: 0.0, a: 1.0)
        //图片
        cell?.imageView?.image = UIImage.init(named: imgArr[indexPath.row])
        
        //显示系统箭头
        cell?.accessoryType = .disclosureIndicator
        //
        cell?.selectionStyle = .none
        
        return cell!
    }
    
    //MARK: 代理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.hexInt(0xf3f3f3)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    
}








