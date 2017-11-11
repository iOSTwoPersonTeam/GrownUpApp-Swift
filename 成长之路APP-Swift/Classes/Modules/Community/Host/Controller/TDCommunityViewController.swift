//
//  TDCommunityViewController.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/6.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit

class TDCommunityViewController: TDContentViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //作为导航控制器的的根视图控制器不需要父类中的返回按钮
        self.navigationItem.leftBarButtonItem = nil;
//        navigationItem.title = "社区"
        view.backgroundColor = UIColor.blue
        // Do any additional setup after loading the view.
        // 配置子视图
        configSubViews()
    }

}

// MARK: --重写配置子视图的方法
extension TDCommunityViewController {
    
    @objc dynamic override func configSubViews() {
        self.type = .TDContentSubScribetyleDownload

    tdPageVc.view.snp.makeConstraints { (make) in
        make.top.equalTo(self.view.snp.top)
        make.left.right.equalTo(self.view)
        make.bottom.equalTo(self.view.snp.bottom).offset(-49)
    }
  }
    
}









