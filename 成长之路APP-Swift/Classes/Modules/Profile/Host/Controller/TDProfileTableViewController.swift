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
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: SCREENWITH, height: self.view.height - 49), style: UITableViewStyle.grouped)
        tableView.delegate = self as? UITableViewDelegate
        tableView.dataSource = self as? UITableViewDataSource
        tableView.backgroundColor = UIColor.hexInt(0xf3f3f3)
        self.view.addSubview(tableView)
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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    

}



//MARK: -tableView 代理 & 数据源
//extension TDProfileTableViewController: UITableViewDelegate, UITableViewDataSource {
//    
//    
//    
//    
//    
//}








