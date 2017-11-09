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

    //MARK: -普通属性
    var lightFlag: Bool = true
    
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
    
    //头部视图
    lazy var headerView: TDProfileHeaderView = {
        let view = TDProfileHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: SCREENWITH, height: headerViewH))
        return view
    }()
    
    //状态栏
    lazy var statusBackView: UIView = {
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: SCREENWITH, height:20 ))
        self.view.addSubview(view)
        self.view.bringSubview(toFront: view)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //作为导航控制器的的根视图控制器不需要父类中的返回按钮
        self.navigationItem.leftBarButtonItem = nil;
        view.backgroundColor = UIColor.hexInt(0xf3f3f3)
        automaticallyAdjustsScrollViewInsets = false
        //添加tableView
         self.view.addSubview(tableView)
        /// 初始化
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    //MARK: -设置状态栏样式
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if lightFlag {
            return UIStatusBarStyle.lightContent
        } else {
            return UIStatusBarStyle.default
        }
    }

}

// MARK:- 初始化
extension TDProfileTableViewController {
    /// 初始化视图
    fileprivate func setupView() {
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: SCREENWITH, height: headerViewH))
        tableView.addSubview(headerView)
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
        let cell = tableView.cellForRow(at: indexPath)
        guard let title = cell?.textLabel?.text else {
            return
        }
        if title == kMeSetting {  //设置
            junpSetting()
        }
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

//MARK: -滚动tableView
extension TDProfileTableViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY <= 0 {
            headerView.frame = CGRect.init(x: offsetY * 0.5, y: offsetY, width: SCREENWITH - offsetY, height: headerViewH - offsetY)
        }
        
        //随机设置状态栏样式
        if offsetY < 200.0 {
            statusBackView.alpha = 0.0
            setStatusBarStyle(islight: true)
        } else if offsetY >= 200 && offsetY < 220 {
            let alpha:CGFloat = (offsetY - 200) / 20.0
            view.bringSubview(toFront: statusBackView)
            statusBackView.alpha = alpha
        } else {
            statusBackView.alpha = 1.0
            view.bringSubview(toFront: statusBackView)
            setStatusBarStyle(islight: false)
        }
        
    }
    
    //设置状态栏样式
    func setStatusBarStyle(islight: Bool) {
        if islight && lightFlag == false {
            lightFlag = true
            setNeedsStatusBarAppearanceUpdate() //更新状态栏样式
        } else if !islight && lightFlag == true {
            
            lightFlag = false
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    
}


//MARK: -界面跳转
extension TDProfileTableViewController {
    //MARK: -设置
    fileprivate func junpSetting() {
        let settingVC = TDSettingViewController()
        settingVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(settingVC, animated: true)
    }
}



















