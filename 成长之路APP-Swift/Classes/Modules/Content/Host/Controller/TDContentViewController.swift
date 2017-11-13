//
//  TDContentViewController.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/6.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit

// MARK: -视图类型枚举(枚举方法)
enum TDContentSubScribeStyle: NSInteger {
    case TDContentSubScribeStyleScribe = 0    // 订阅听
    case TDContentSubScribetyleDownload = 1   // 下载听
}

class TDContentViewController: TDBaseViewController {

    // MARK: --定义枚举属性
    var type: TDContentSubScribeStyle = TDContentSubScribeStyle.TDContentSubScribeStyleScribe
    
    // MARK: -懒加载属性
    /// 选项导航栏
    lazy var nav: TDContentScribeNavView = {
        let titleArr: [String] = self.type == TDContentSubScribeStyle.TDContentSubScribeStyleScribe ? ["推荐", "订阅", "历史"] : ["专辑", "声音", "下载中"]  // 三目运算符进行判断
        let navi = TDContentScribeNavView.createWith(titles:  titleArr)
        // 回调函数 类似于block
        navi.subScribeNavViewDidSubClick = {
            (view, index) -> () in
            self.navigationDidSelectedController(with: index)  // 根据上方点击的控件,确定下方对应的控制器
        }
        return navi
    }()
    
    // 子控制器数组  懒加载控制器数组
    lazy var controllers: [UIViewController] = {
        var cons: [UIViewController] = [UIViewController]()
        switch self.type {  // 根据枚举确定switch的显示对象
        case .TDContentSubScribeStyleScribe:
            cons.append(TDInterestViewController())
            cons.append(TDSubscriptionViewController())
            cons.append(TDHistoryViewController())
        case .TDContentSubScribetyleDownload:
            cons.append(TDAlbumViewController())
            cons.append(TDVoiceViewController())
            cons.append(TDDownLoadingViewController())
        }
        return cons
    }()
    
    // 控制多个控制器的
    lazy var tdPageVc: TDPageViewController = {
        let pageVc = TDPageViewController.init(superController: self, controllers: self.controllers)
        pageVc.delegate = self  // 指定代理 要实现对应的代理方法
        self.view.addSubview(pageVc.view)
        return pageVc
    }()
    
    /*---------------------------------------------*/
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: --重写init
    init(with type: TDContentSubScribeStyle) {
        super.init(nibName: nil, bundle: nil)
        self.type = type
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 加载视图方法
    override func viewDidLoad() {
        super.viewDidLoad()
        //作为导航控制器的的根视图控制器不需要父类中的返回按钮
        self.navigationItem.leftBarButtonItem = nil;
       //设置配背景颜色
        view.backgroundColor = UIColor.hexInt(0xf3f3f3)
       
        //配置子视图
        configSubViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 导航栏上自定义视图
        navigationController?.navigationBar.addSubview(self.nav)
    }
    
    // 视图即将消失的时候 删除相关控件
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let navBarSubViews = navigationController?.navigationBar.subviews else {
            return
        }
        for view in navBarSubViews {
            // classForCoder 获取对象类型
            if view.classForCoder == TDContentScribeNavView.classForCoder() {
                view.removeFromSuperview()
            }
        }
    }
    
}


// MARK: --配置下方子视图
extension TDContentViewController {
    // MARK: -注意:后面继承会用到此方法 因此这里要用@objc来进行修饰***
   @objc func configSubViews() {
        tdPageVc.view.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top)
            make.left.right.equalTo(self.view)
            make.bottom.equalTo(self.view.snp.bottom).offset(-49)
        }
    }
}


// MARK: --TDpageViewCOntrollerDelegate
extension TDContentViewController: TDPageViewControllerDelegate {
    
    func tdPageCurrentSubControlerIndex(index: NSInteger, pageViewController: TDPageViewController) {
        // 改变小滑块的位置
        nav.scrollToController(at: index)
    }
}

// MARK: -nav上的按钮点击是在回调中调用的方法  创建相应的下方控制器
extension TDContentViewController {
    func navigationDidSelectedController(with index: NSInteger) {
        tdPageVc.setCurrnetSubControllerWith(index: index)
    }
}














