//
//  TDBaseViewController.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/6.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit

class TDBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
   
        automaticallyAdjustsScrollViewInsets = false
        //设置背景颜色
        view.backgroundColor = UIColor.hexInt(0xf3f3f3)
    }
    
    //视图将要出现
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isTranslucent = false
    }

}
