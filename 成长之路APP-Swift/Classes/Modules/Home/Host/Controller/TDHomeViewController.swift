//
//  TDHomeViewController.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/6.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit

// MARK: --全局变量 -当前navigationController


class TDHomeViewController: TDBaseViewController {

    //MARK: --懒加载属性
    ///子标题
    lazy var subTitleArr: [String] = {
        return ["推荐","分类","广播","榜单","主播"]
    }()
    
    ///通过子标题获取初始化后的子控制器
    lazy var controllers: [UIViewController] = {
        var cons: [UIViewController] = [UIViewController]()
        for title in self.subTitleArr {
            let con = TDSubHomeFactory.subHomeVCWith(identifier: title)
            cons.append(con)
        }
        return cons
    }()
    
    //懒加载子标题视图View
    lazy var subTitleView: TDHomeSubTitleView = {
        let view = TDHomeSubTitleView.init(frame: CGRect.init(x: 0, y: 0, width: SCREENWITH, height: 40))
        view.delegate  = self   //遵循协议
        self.view.addSubview(view)
        return view
    }()
    
    //控制多个子控制器
    lazy var tdPageVC: TDPageViewController = {
        let pageVc = TDPageViewController.init(superController: self, controllers: self.controllers)
        pageVc.delegate = self
        self.view.addSubview(pageVc.view)
        return pageVc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //作为导航控制器的的根视图控制器不需要父类中的返回按钮
        self.navigationItem.leftBarButtonItem = nil;
        navigationItem.title = "首页"
       view.backgroundColor = UIColor.init(red: 0.92, green: 0.93, blue: 0.93, alpha: 1.0)
        
        self.subTitleView.titileArray = subTitleArr
        //配置子标题视图
        configSubView()
        
    }

}

// MARK: --配置子标题视图
extension TDHomeViewController {
    func configSubView() {
        tdPageVC.view.snp.makeConstraints { (make) in
            make.top.equalTo(subTitleView.snp.bottom)
            make.left.right.equalTo(view)
            make.bottom.equalTo(view.snp.bottom).offset(-49)
        }
    }

}


// MARK: -TDPageViewController代理 下方控制器
extension TDHomeViewController: TDPageViewControllerDelegate {

    func tdPageCurrentSubControlerIndex(index: NSInteger, pageViewController: TDPageViewController) {
        subTitleView.jumpShow(at: index)   //让上面的视图标题跳转到对应位置
    }
    
}

// MARK -TDHomeDubTitleViewDelagate代理 上面标题View
extension TDHomeViewController: TDHomeSubTitleViewDelagate {
    func homeSubTitleViewDidSelected(_ titleView: TDHomeSubTitleView, atIndex: NSInteger, title: String) {
        // 跳转相对应的子标题界面   让下方的视图控制器跳转到对应位置
        tdPageVC.setCurrnetSubControllerWith(index: atIndex)
    }
}











